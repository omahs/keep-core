import { task, types } from "hardhat/config"

import type { BigNumber, Signer } from "ethers"
import type { HardhatRuntimeEnvironment } from "hardhat/types"
import type { TransactionResponse } from "@ethersproject/abstract-provider"

// eslint-disable-next-line import/prefer-default-export
export const TASK_SEND_ETH = "send-eth"

task(TASK_SEND_ETH, "Send ether to an address")
  .addOptionalParam(
    "from",
    "Address to send value from",
    undefined,
    types.string
  )
  .addParam(
    "amount",
    'Amount to transfer with unit, e.g. "0.5 ether", "100 gwei"',
    undefined,
    types.string
  )
  .addParam("to", "Transfer receiver address", undefined, types.string)
  .setAction(async (args, hre) => {
    const from: Signer = args.from
      ? await hre.ethers.getSigner(args.from)
      : (await hre.ethers.getSigners())[0]

    const amount: BigNumber = parseValue(args.amount, hre)

    // FIXME: `validate` will fail for badly checksummed addresses
    // see: https://github.com/ethers-io/ethers.js/discussions/3261
    const to = hre.helpers.address.validate(args.to)

    const tx: TransactionResponse = await from.sendTransaction({
      to,
      value: amount,
    })

    console.log(
      `sending ${amount} wei from ${await from.getAddress()} to ${to} in tx ${
        tx.hash
      }...`
    )

    await tx.wait()
  })

export function parseValue(
  value: string,
  hre: HardhatRuntimeEnvironment
): BigNumber {
  const parsed = String(value).trim().split(" ")

  if (parsed.length === 0 || parsed.length > 2) {
    throw new Error(`invalid value: ${value}`)
  }

  return hre.ethers.utils.parseUnits(parsed[0], parsed[1] || "wei")
}
