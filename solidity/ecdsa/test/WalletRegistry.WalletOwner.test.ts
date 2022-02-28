import { ethers, helpers } from "hardhat"
import { expect } from "chai"
import { smock } from "@defi-wonderland/smock"

import { params, walletRegistryFixture } from "./fixtures"
import { submitRelayEntry } from "./utils/randomBeacon"
import { signAndSubmitCorrectDkgResult } from "./utils/dkg"
import ecdsaData from "./data/ecdsa"

import type { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers"
import type { DkgResult } from "./utils/dkg"
import type { FakeContract } from "@defi-wonderland/smock"
import type {
  IWalletOwner,
  WalletRegistry,
  WalletRegistryStub,
} from "../typechain"
import type { ContractTransaction } from "ethers"

const { mineBlocks } = helpers.time

const { createSnapshot, restoreSnapshot } = helpers.snapshot

describe("WalletRegistry - Wallet Owner", async () => {
  const groupPublicKey: string = ethers.utils.hexValue(
    ecdsaData.group1.publicKey
  )
  const groupPublicKeyHash: string = ethers.utils.keccak256(groupPublicKey)

  let walletRegistry: WalletRegistryStub & WalletRegistry
  let walletOwner: FakeContract<IWalletOwner>

  before("load test fixture", async () => {
    // eslint-disable-next-line @typescript-eslint/no-extra-semi
    ;({ walletRegistry, walletOwner } = await walletRegistryFixture())
  })

  describe("approveDkgResult", async () => {
    let dkgResult: DkgResult
    let submitter: SignerWithAddress

    before(async () => {
      await createSnapshot()

      await walletOwner.notifyWalletCreated.reverts(
        "wallet owner internal error"
      )

      await walletRegistry.connect(walletOwner.wallet).requestNewWallet()
      const { startBlock, dkgSeed } = await submitRelayEntry(walletRegistry)

      ;({ dkgResult, submitter } = await signAndSubmitCorrectDkgResult(
        walletRegistry,
        groupPublicKey,
        dkgSeed,
        startBlock
      ))

      await mineBlocks(params.dkgResultChallengePeriodLength)
    })

    after(async () => {
      await restoreSnapshot()

      await walletOwner.notifyWalletCreated.reset()
    })

    context("when notifyWalletCreated reverts", async () => {
      let tx: Promise<ContractTransaction>

      before(async () => {
        await createSnapshot()

        await walletOwner.notifyWalletCreated.reverts(
          "wallet owner internal error"
        )

        tx = walletRegistry.connect(submitter).approveDkgResult(dkgResult)
      })

      after(async () => {
        await restoreSnapshot()

        await walletOwner.notifyWalletCreated.reset()
      })

      it("should succeed", async () => {
        await expect(tx).to.not.be.reverted
      })

      it("should call random beacon", async () => {
        await expect(walletOwner.notifyWalletCreated).to.be.calledWith(
          groupPublicKeyHash
        )
      })

      it("should emit WalletOwnerNotificationFailed", async () => {
        await expect(tx)
          .to.emit(walletRegistry, "WalletOwnerNotificationFailed")
          .withArgs(groupPublicKeyHash)
      })
    })

    context("when notifyWalletCreated succeeds", async () => {
      let tx: Promise<ContractTransaction>

      before(async () => {
        await createSnapshot()

        tx = walletRegistry.connect(submitter).approveDkgResult(dkgResult)
      })

      after(async () => {
        await restoreSnapshot()
      })

      it("should succeed", async () => {
        await expect(tx).to.not.be.reverted
      })

      it("should call wallet owner", async () => {
        await expect(walletOwner.notifyWalletCreated).to.be.calledWith(
          groupPublicKeyHash
        )
      })
    })
  })
})

async function fakeWalletOwner(
  walletRegistry: WalletRegistry
): Promise<FakeContract<IWalletOwner>> {
  const walletOwner = await smock.fake<IWalletOwner>("IWalletOwner", {
    address: await walletRegistry.callStatic.walletOwner(),
  })

  await (
    await ethers.getSigners()
  )[0].sendTransaction({
    to: walletOwner.address,
    value: ethers.utils.parseEther("1"),
  })

  return walletOwner
}
