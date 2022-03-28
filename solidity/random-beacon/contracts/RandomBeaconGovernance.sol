// SPDX-License-Identifier: MIT
//
// ▓▓▌ ▓▓ ▐▓▓ ▓▓▓▓▓▓▓▓▓▓▌▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▄
// ▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▌▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//   ▓▓▓▓▓▓    ▓▓▓▓▓▓▓▀    ▐▓▓▓▓▓▓    ▐▓▓▓▓▓   ▓▓▓▓▓▓     ▓▓▓▓▓   ▐▓▓▓▓▓▌   ▐▓▓▓▓▓▓
//   ▓▓▓▓▓▓▄▄▓▓▓▓▓▓▓▀      ▐▓▓▓▓▓▓▄▄▄▄         ▓▓▓▓▓▓▄▄▄▄         ▐▓▓▓▓▓▌   ▐▓▓▓▓▓▓
//   ▓▓▓▓▓▓▓▓▓▓▓▓▓▀        ▐▓▓▓▓▓▓▓▓▓▓         ▓▓▓▓▓▓▓▓▓▓         ▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//   ▓▓▓▓▓▓▀▀▓▓▓▓▓▓▄       ▐▓▓▓▓▓▓▀▀▀▀         ▓▓▓▓▓▓▀▀▀▀         ▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▀
//   ▓▓▓▓▓▓   ▀▓▓▓▓▓▓▄     ▐▓▓▓▓▓▓     ▓▓▓▓▓   ▓▓▓▓▓▓     ▓▓▓▓▓   ▐▓▓▓▓▓▌
// ▓▓▓▓▓▓▓▓▓▓ █▓▓▓▓▓▓▓▓▓ ▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓
// ▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓ ▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓
//
//

pragma solidity ^0.8.9;

import "./RandomBeacon.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title Keep Random Beacon Governance
/// @notice Owns the `RandomBeacon` contract and is responsible for updating its
///         governable parameters in respect to governance delay individual
///         for each parameter.
contract RandomBeaconGovernance is Ownable {
    uint256 public newGovernanceDelay;
    uint256 public governanceDelayChangeInitiated;

    address public newRandomBeaconOwner;
    uint256 public randomBeaconOwnershipTransferInitiated;

    uint256 public newRelayRequestFee;
    uint256 public relayRequestFeeChangeInitiated;

    uint256 public newRelayEntrySoftTimeout;
    uint256 public relayEntrySoftTimeoutChangeInitiated;

    uint256 public newRelayEntryHardTimeout;
    uint256 public relayEntryHardTimeoutChangeInitiated;

    uint256 public newCallbackGasLimit;
    uint256 public callbackGasLimitChangeInitiated;

    uint256 public newGroupCreationFrequency;
    uint256 public groupCreationFrequencyChangeInitiated;

    uint256 public newGroupLifetime;
    uint256 public groupLifetimeChangeInitiated;

    uint256 public newDkgResultChallengePeriodLength;
    uint256 public dkgResultChallengePeriodLengthChangeInitiated;

    uint256 public newDkgResultSubmissionTimeout;
    uint256 public dkgResultSubmissionTimeoutChangeInitiated;

    uint256 public newSubmitterPrecedencePeriodLength;
    uint256 public dkgSubmitterPrecedencePeriodLengthChangeInitiated;

    uint256 public newDkgResultSubmissionReward;
    uint256 public dkgResultSubmissionRewardChangeInitiated;

    uint256 public newSortitionPoolUnlockingReward;
    uint256 public sortitionPoolUnlockingRewardChangeInitiated;

    uint256 public newIneligibleOperatorNotifierReward;
    uint256 public ineligibleOperatorNotifierRewardChangeInitiated;

    uint256 public newRelayEntrySubmissionFailureSlashingAmount;
    uint256 public relayEntrySubmissionFailureSlashingAmountChangeInitiated;

    uint256 public newMaliciousDkgResultSlashingAmount;
    uint256 public maliciousDkgResultSlashingAmountChangeInitiated;

    uint256 public newUnauthorizedSigningSlashingAmount;
    uint256 public unauthorizedSigningSlashingAmountChangeInitiated;

    uint256 public newSortitionPoolRewardsBanDuration;
    uint256 public sortitionPoolRewardsBanDurationChangeInitiated;

    uint256 public newRelayEntryTimeoutNotificationRewardMultiplier;
    uint256 public relayEntryTimeoutNotificationRewardMultiplierChangeInitiated;

    uint256 public newUnauthorizedSigningNotificationRewardMultiplier;
    uint256
        public unauthorizedSigningNotificationRewardMultiplierChangeInitiated;

    uint96 public newMinimumAuthorization;
    uint256 public minimumAuthorizationChangeInitiated;

    uint64 public newAuthorizationDecreaseDelay;
    uint256 public authorizationDecreaseDelayChangeInitiated;

    uint256 public newDkgMaliciousResultNotificationRewardMultiplier;
    uint256
        public dkgMaliciousResultNotificationRewardMultiplierChangeInitiated;

    uint256 public newDkgApprovalGasOffset;
    uint256 public dkgApprovalGasOffsetChangeInitiated;

    uint256 public newFailedHeartbeatGasOffset;
    uint256 public failedHeartbeatGasOffsetChangeInitiated;

    uint256 public newRelayEntrySubmissionGasOffset;
    uint256 public relayEntrySubmissionGasOffsetChangeInitiated;

    uint256 public newDkgResultSubmissionGas;
    uint256 public dkgResultSubmissionGasChangeInitiated;

    RandomBeacon public randomBeacon;

    uint256 public governanceDelay;

    event GovernanceDelayUpdateStarted(
        uint256 governanceDelay,
        uint256 timestamp
    );
    event GovernanceDelayUpdated(uint256 governanceDelay);

    event RandomBeaconOwnershipTransferStarted(
        address newRandomBeaconOwner,
        uint256 timestamp
    );
    event RandomBeaconOwnershipTransferred(address newRandomBeaconOwner);

    event RelayRequestFeeUpdateStarted(
        uint256 relayRequestFee,
        uint256 timestamp
    );
    event RelayRequestFeeUpdated(uint256 relayRequestFee);

    event RelayEntrySoftTimeoutUpdateStarted(
        uint256 relayEntrySoftTimeout,
        uint256 timestamp
    );
    event RelayEntrySoftTimeoutUpdated(uint256 relayEntrySoftTimeout);

    event RelayEntryHardTimeoutUpdateStarted(
        uint256 relayEntryHardTimeout,
        uint256 timestamp
    );
    event RelayEntryHardTimeoutUpdated(uint256 relayEntryHardTimeout);

    event CallbackGasLimitUpdateStarted(
        uint256 callbackGasLimit,
        uint256 timestamp
    );
    event CallbackGasLimitUpdated(uint256 callbackGasLimit);

    event GroupCreationFrequencyUpdateStarted(
        uint256 groupCreationFrequency,
        uint256 timestamp
    );
    event GroupCreationFrequencyUpdated(uint256 groupCreationFrequency);

    event GroupLifetimeUpdateStarted(uint256 groupLifetime, uint256 timestamp);
    event GroupLifetimeUpdated(uint256 groupLifetime);

    event DkgResultChallengePeriodLengthUpdateStarted(
        uint256 dkgResultChallengePeriodLength,
        uint256 timestamp
    );
    event DkgResultChallengePeriodLengthUpdated(
        uint256 dkgResultChallengePeriodLength
    );

    event DkgResultSubmissionTimeoutUpdateStarted(
        uint256 dkgResultSubmissionTimeout,
        uint256 timestamp
    );
    event DkgResultSubmissionTimeoutUpdated(uint256 dkgResultSubmissionTimeout);

    event DkgSubmitterPrecedencePeriodLengthUpdateStarted(
        uint256 submitterPrecedencePeriodLength,
        uint256 timestamp
    );
    event DkgSubmitterPrecedencePeriodLengthUpdated(
        uint256 submitterPrecedencePeriodLength
    );

    event DkgResultSubmissionRewardUpdateStarted(
        uint256 dkgResultSubmissionReward,
        uint256 timestamp
    );
    event DkgResultSubmissionRewardUpdated(uint256 dkgResultSubmissionReward);

    event SortitionPoolUnlockingRewardUpdateStarted(
        uint256 sortitionPoolUnlockingReward,
        uint256 timestamp
    );
    event SortitionPoolUnlockingRewardUpdated(
        uint256 sortitionPoolUnlockingReward
    );

    event IneligibleOperatorNotifierRewardUpdateStarted(
        uint256 ineligibleOperatorNotifierReward,
        uint256 timestamp
    );
    event IneligibleOperatorNotifierRewardUpdated(
        uint256 ineligibleOperatorNotifierReward
    );

    event RelayEntrySubmissionFailureSlashingAmountUpdateStarted(
        uint256 relayEntrySubmissionFailureSlashingAmount,
        uint256 timestamp
    );
    event RelayEntrySubmissionFailureSlashingAmountUpdated(
        uint256 relayEntrySubmissionFailureSlashingAmount
    );

    event MaliciousDkgResultSlashingAmountUpdateStarted(
        uint256 maliciousDkgResultSlashingAmount,
        uint256 timestamp
    );
    event MaliciousDkgResultSlashingAmountUpdated(
        uint256 maliciousDkgResultSlashingAmount
    );

    event UnauthorizedSigningSlashingAmountUpdateStarted(
        uint256 unauthorizedSigningSlashingAmount,
        uint256 timestamp
    );
    event UnauthorizedSigningSlashingAmountUpdated(
        uint256 unauthorizedSigningSlashingAmount
    );

    event SortitionPoolRewardsBanDurationUpdateStarted(
        uint256 sortitionPoolRewardsBanDuration,
        uint256 timestamp
    );
    event SortitionPoolRewardsBanDurationUpdated(
        uint256 sortitionPoolRewardsBanDuration
    );

    event RelayEntryTimeoutNotificationRewardMultiplierUpdateStarted(
        uint256 relayEntryTimeoutNotificationRewardMultiplier,
        uint256 timestamp
    );
    event RelayEntryTimeoutNotificationRewardMultiplierUpdated(
        uint256 relayEntryTimeoutNotificationRewardMultiplier
    );

    event UnauthorizedSigningNotificationRewardMultiplierUpdateStarted(
        uint256 unauthorizedSigningTimeoutNotificationRewardMultiplier,
        uint256 timestamp
    );
    event UnauthorizedSigningNotificationRewardMultiplierUpdated(
        uint256 unauthorizedSigningTimeoutNotificationRewardMultiplier
    );

    event MinimumAuthorizationUpdateStarted(
        uint96 minimumAuthorization,
        uint256 timestamp
    );
    event MinimumAuthorizationUpdated(uint96 minimumAuthorization);

    event AuthorizationDecreaseDelayUpdateStarted(
        uint64 authorizationDecreaseDelay,
        uint256 timestamp
    );
    event AuthorizationDecreaseDelayUpdated(uint64 authorizationDecreaseDelay);

    event DkgMaliciousResultNotificationRewardMultiplierUpdateStarted(
        uint256 dkgMaliciousResultNotificationRewardMultiplier,
        uint256 timestamp
    );
    event DkgMaliciousResultNotificationRewardMultiplierUpdated(
        uint256 dkgMaliciousResultNotificationRewardMultiplier
    );

    event DkgApprovalGasOffsetUpdateStarted(
        uint256 dkgApprovalGasOffset,
        uint256 timestamp
    );
    event DkgApprovalGasOffsetUpdated(uint256 dkgApprovalGasOffset);

    event FailedHeartbeatGasOffsetUpdateStarted(
        uint256 failedHeartbeatGasOffset,
        uint256 timestamp
    );
    event FailedHeartbeatGasOffsetUpdated(uint256 failedHeartbeatGasOffset);

    event RelayEntrySubmissionGasOffsetUpdateStarted(
        uint256 relayEntrySubmissionGasOffset,
        uint256 timestamp
    );
    event RelayEntrySubmissionGasOffsetUpdated(
        uint256 relayEntrySubmissionGasOffset
    );

    event DkgResultSubmissionGasUpdateStarted(
        uint256 dkgResultSubmissionGas,
        uint256 timestamp
    );
    event DkgResultSubmissionGasUpdated(uint256 dkgResultSubmissionGas);

    /// @notice Reverts if called before the governance delay elapses.
    /// @param changeInitiatedTimestamp Timestamp indicating the beginning
    ///        of the change.
    modifier onlyAfterGovernanceDelay(uint256 changeInitiatedTimestamp) {
        /* solhint-disable not-rely-on-time */
        require(changeInitiatedTimestamp > 0, "Change not initiated");
        require(
            block.timestamp - changeInitiatedTimestamp >= governanceDelay,
            "Governance delay has not elapsed"
        );
        _;
        /* solhint-enable not-rely-on-time */
    }

    constructor(RandomBeacon _randomBeacon, uint256 _governanceDelay) {
        randomBeacon = _randomBeacon;
        governanceDelay = _governanceDelay;
    }

    /// @notice Begins the governance delay update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newGovernanceDelay New governance delay
    function beginGovernanceDelayUpdate(uint256 _newGovernanceDelay)
        external
        onlyOwner
    {
        newGovernanceDelay = _newGovernanceDelay;
        /* solhint-disable not-rely-on-time */
        governanceDelayChangeInitiated = block.timestamp;
        emit GovernanceDelayUpdateStarted(_newGovernanceDelay, block.timestamp);
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the governance delay update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeGovernanceDelayUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(governanceDelayChangeInitiated)
    {
        emit GovernanceDelayUpdated(newGovernanceDelay);
        governanceDelay = newGovernanceDelay;
        governanceDelayChangeInitiated = 0;
        newGovernanceDelay = 0;
    }

    /// @notice Begins the random beacon ownership transfer process.
    /// @dev Can be called only by the contract owner.
    function beginRandomBeaconOwnershipTransfer(address _newRandomBeaconOwner)
        external
        onlyOwner
    {
        require(
            address(_newRandomBeaconOwner) != address(0),
            "New random beacon owner address cannot be zero"
        );
        newRandomBeaconOwner = _newRandomBeaconOwner;
        /* solhint-disable not-rely-on-time */
        randomBeaconOwnershipTransferInitiated = block.timestamp;
        emit RandomBeaconOwnershipTransferStarted(
            _newRandomBeaconOwner,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the random beacon ownership transfer process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeRandomBeaconOwnershipTransfer()
        external
        onlyOwner
        onlyAfterGovernanceDelay(randomBeaconOwnershipTransferInitiated)
    {
        emit RandomBeaconOwnershipTransferred(newRandomBeaconOwner);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.transferOwnership(newRandomBeaconOwner);
        randomBeaconOwnershipTransferInitiated = 0;
        newRandomBeaconOwner = address(0);
    }

    /// @notice Begins the relay request fee update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newRelayRequestFee New relay request fee
    function beginRelayRequestFeeUpdate(uint256 _newRelayRequestFee)
        external
        onlyOwner
    {
        /* solhint-disable not-rely-on-time */
        newRelayRequestFee = _newRelayRequestFee;
        relayRequestFeeChangeInitiated = block.timestamp;
        emit RelayRequestFeeUpdateStarted(_newRelayRequestFee, block.timestamp);
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the relay request fee update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeRelayRequestFeeUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(relayRequestFeeChangeInitiated)
    {
        emit RelayRequestFeeUpdated(newRelayRequestFee);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRelayEntryParameters(
            newRelayRequestFee,
            randomBeacon.relayEntrySoftTimeout(),
            randomBeacon.relayEntryHardTimeout(),
            randomBeacon.callbackGasLimit()
        );
        relayRequestFeeChangeInitiated = 0;
        newRelayRequestFee = 0;
    }

    /// @notice Begins the relay entry soft timeout update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newRelayEntrySoftTimeout New relay entry submission timeout in blocks
    function beginRelayEntrySoftTimeoutUpdate(uint256 _newRelayEntrySoftTimeout)
        external
        onlyOwner
    {
        /* solhint-disable not-rely-on-time */
        require(
            _newRelayEntrySoftTimeout > 0,
            "Relay entry soft timeout must be > 0"
        );
        newRelayEntrySoftTimeout = _newRelayEntrySoftTimeout;
        relayEntrySoftTimeoutChangeInitiated = block.timestamp;
        emit RelayEntrySoftTimeoutUpdateStarted(
            _newRelayEntrySoftTimeout,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the relay entry soft timeout update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeRelayEntrySoftTimeoutUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(relayEntrySoftTimeoutChangeInitiated)
    {
        emit RelayEntrySoftTimeoutUpdated(newRelayEntrySoftTimeout);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRelayEntryParameters(
            randomBeacon.relayRequestFee(),
            newRelayEntrySoftTimeout,
            randomBeacon.relayEntryHardTimeout(),
            randomBeacon.callbackGasLimit()
        );
        relayEntrySoftTimeoutChangeInitiated = 0;
        newRelayEntrySoftTimeout = 0;
    }

    /// @notice Begins the relay entry hard timeout update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newRelayEntryHardTimeout New relay entry hard timeout in blocks
    function beginRelayEntryHardTimeoutUpdate(uint256 _newRelayEntryHardTimeout)
        external
        onlyOwner
    {
        /* solhint-disable not-rely-on-time */
        newRelayEntryHardTimeout = _newRelayEntryHardTimeout;
        relayEntryHardTimeoutChangeInitiated = block.timestamp;
        emit RelayEntryHardTimeoutUpdateStarted(
            _newRelayEntryHardTimeout,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the relay entry hard timeout update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeRelayEntryHardTimeoutUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(relayEntryHardTimeoutChangeInitiated)
    {
        emit RelayEntryHardTimeoutUpdated(newRelayEntryHardTimeout);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRelayEntryParameters(
            randomBeacon.relayRequestFee(),
            randomBeacon.relayEntrySoftTimeout(),
            newRelayEntryHardTimeout,
            randomBeacon.callbackGasLimit()
        );
        relayEntryHardTimeoutChangeInitiated = 0;
        newRelayEntryHardTimeout = 0;
    }

    /// @notice Begins the callback gas limit update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newCallbackGasLimit New callback gas limit
    function beginCallbackGasLimitUpdate(uint256 _newCallbackGasLimit)
        external
        onlyOwner
    {
        /* solhint-disable not-rely-on-time */
        // slither-disable-next-line too-many-digits
        require(
            _newCallbackGasLimit > 0 && _newCallbackGasLimit <= 1e6,
            "Callback gas limit must be > 0 and <= 1000000"
        );
        newCallbackGasLimit = _newCallbackGasLimit;
        callbackGasLimitChangeInitiated = block.timestamp;
        emit CallbackGasLimitUpdateStarted(
            _newCallbackGasLimit,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the callback gas limit update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeCallbackGasLimitUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(callbackGasLimitChangeInitiated)
    {
        emit CallbackGasLimitUpdated(newCallbackGasLimit);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRelayEntryParameters(
            randomBeacon.relayRequestFee(),
            randomBeacon.relayEntrySoftTimeout(),
            randomBeacon.relayEntryHardTimeout(),
            newCallbackGasLimit
        );
        callbackGasLimitChangeInitiated = 0;
        newCallbackGasLimit = 0;
    }

    /// @notice Begins the group creation frequency update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newGroupCreationFrequency New group creation frequency
    function beginGroupCreationFrequencyUpdate(
        uint256 _newGroupCreationFrequency
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        require(
            _newGroupCreationFrequency > 0,
            "Group creation frequency must be > 0"
        );
        newGroupCreationFrequency = _newGroupCreationFrequency;
        groupCreationFrequencyChangeInitiated = block.timestamp;
        emit GroupCreationFrequencyUpdateStarted(
            _newGroupCreationFrequency,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the group creation frequency update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeGroupCreationFrequencyUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(groupCreationFrequencyChangeInitiated)
    {
        emit GroupCreationFrequencyUpdated(newGroupCreationFrequency);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateGroupCreationParameters(
            newGroupCreationFrequency,
            randomBeacon.groupLifetime()
        );
        groupCreationFrequencyChangeInitiated = 0;
        newGroupCreationFrequency = 0;
    }

    /// @notice Begins the group lifetime update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newGroupLifetime New group lifetime in blocks
    function beginGroupLifetimeUpdate(uint256 _newGroupLifetime)
        external
        onlyOwner
    {
        /* solhint-disable not-rely-on-time */
        require(
            _newGroupLifetime >= 1 days && _newGroupLifetime <= 2 weeks,
            "Group lifetime must be >= 1 day and <= 2 weeks"
        );
        newGroupLifetime = _newGroupLifetime;
        groupLifetimeChangeInitiated = block.timestamp;
        emit GroupLifetimeUpdateStarted(_newGroupLifetime, block.timestamp);
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the group creation frequency update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeGroupLifetimeUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(groupLifetimeChangeInitiated)
    {
        emit GroupLifetimeUpdated(newGroupLifetime);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateGroupCreationParameters(
            randomBeacon.groupCreationFrequency(),
            newGroupLifetime
        );
        groupLifetimeChangeInitiated = 0;
        newGroupLifetime = 0;
    }

    /// @notice Begins the DKG result challenge period length update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newDkgResultChallengePeriodLength New DKG result challenge
    ///        period length in blocks
    function beginDkgResultChallengePeriodLengthUpdate(
        uint256 _newDkgResultChallengePeriodLength
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        require(
            _newDkgResultChallengePeriodLength >= 10,
            "DKG result challenge period length must be >= 10"
        );
        newDkgResultChallengePeriodLength = _newDkgResultChallengePeriodLength;
        dkgResultChallengePeriodLengthChangeInitiated = block.timestamp;
        emit DkgResultChallengePeriodLengthUpdateStarted(
            _newDkgResultChallengePeriodLength,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the DKG result challenge period length update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeDkgResultChallengePeriodLengthUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(dkgResultChallengePeriodLengthChangeInitiated)
    {
        emit DkgResultChallengePeriodLengthUpdated(
            newDkgResultChallengePeriodLength
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateDkgParameters(
            newDkgResultChallengePeriodLength,
            randomBeacon.dkgResultSubmissionTimeout(),
            randomBeacon.dkgSubmitterPrecedencePeriodLength()
        );
        dkgResultChallengePeriodLengthChangeInitiated = 0;
        newDkgResultChallengePeriodLength = 0;
    }

    /// @notice Begins the DKG result submission timeout update
    ///         process.
    /// @dev Can be called only by the contract owner.
    /// @param _newDkgResultSubmissionTimeout New DKG result submission
    ///        timeout in blocks
    function beginDkgResultSubmissionTimeoutUpdate(
        uint256 _newDkgResultSubmissionTimeout
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        require(
            _newDkgResultSubmissionTimeout > 0,
            "DKG result submission timeout must be > 0"
        );
        newDkgResultSubmissionTimeout = _newDkgResultSubmissionTimeout;
        dkgResultSubmissionTimeoutChangeInitiated = block.timestamp;
        emit DkgResultSubmissionTimeoutUpdateStarted(
            _newDkgResultSubmissionTimeout,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the DKG result submission timeout update
    ///         process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeDkgResultSubmissionTimeoutUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(dkgResultSubmissionTimeoutChangeInitiated)
    {
        emit DkgResultSubmissionTimeoutUpdated(newDkgResultSubmissionTimeout);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateDkgParameters(
            randomBeacon.dkgResultChallengePeriodLength(),
            newDkgResultSubmissionTimeout,
            randomBeacon.dkgSubmitterPrecedencePeriodLength()
        );
        dkgResultSubmissionTimeoutChangeInitiated = 0;
        newDkgResultSubmissionTimeout = 0;
    }

    /// @notice Begins the DKG submitter precedence period length.
    /// @dev Can be called only by the contract owner.
    /// @param _newSubmitterPrecedencePeriodLength New DKG submitter precedence
    ///        period length in blocks
    function beginDkgSubmitterPrecedencePeriodLengthUpdate(
        uint256 _newSubmitterPrecedencePeriodLength
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        require(
            _newSubmitterPrecedencePeriodLength > 0,
            "DKG submitter precedence period length must be > 0"
        );
        newSubmitterPrecedencePeriodLength = _newSubmitterPrecedencePeriodLength;
        dkgSubmitterPrecedencePeriodLengthChangeInitiated = block.timestamp;
        emit DkgSubmitterPrecedencePeriodLengthUpdateStarted(
            _newSubmitterPrecedencePeriodLength,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the DKG submitter precedence period length.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeDkgSubmitterPrecedencePeriodLengthUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            dkgSubmitterPrecedencePeriodLengthChangeInitiated
        )
    {
        emit DkgSubmitterPrecedencePeriodLengthUpdated(
            newSubmitterPrecedencePeriodLength
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateDkgParameters(
            randomBeacon.dkgResultChallengePeriodLength(),
            randomBeacon.dkgResultSubmissionTimeout(),
            newSubmitterPrecedencePeriodLength
        );
        dkgSubmitterPrecedencePeriodLengthChangeInitiated = 0;
        newSubmitterPrecedencePeriodLength = 0;
    }

    /// @notice Begins the DKG result submission reward update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newDkgResultSubmissionReward New DKG result submission reward
    function beginDkgResultSubmissionRewardUpdate(
        uint256 _newDkgResultSubmissionReward
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newDkgResultSubmissionReward = _newDkgResultSubmissionReward;
        dkgResultSubmissionRewardChangeInitiated = block.timestamp;
        emit DkgResultSubmissionRewardUpdateStarted(
            _newDkgResultSubmissionReward,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the DKG result submission reward update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeDkgResultSubmissionRewardUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(dkgResultSubmissionRewardChangeInitiated)
    {
        emit DkgResultSubmissionRewardUpdated(newDkgResultSubmissionReward);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRewardParameters(
            newDkgResultSubmissionReward,
            randomBeacon.sortitionPoolUnlockingReward(),
            randomBeacon.ineligibleOperatorNotifierReward(),
            randomBeacon.sortitionPoolRewardsBanDuration(),
            randomBeacon.relayEntryTimeoutNotificationRewardMultiplier(),
            randomBeacon.unauthorizedSigningNotificationRewardMultiplier(),
            randomBeacon.dkgMaliciousResultNotificationRewardMultiplier()
        );
        dkgResultSubmissionRewardChangeInitiated = 0;
        newDkgResultSubmissionReward = 0;
    }

    /// @notice Begins the sortition pool unlocking reward update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newSortitionPoolUnlockingReward New sortition pool unlocking reward
    function beginSortitionPoolUnlockingRewardUpdate(
        uint256 _newSortitionPoolUnlockingReward
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newSortitionPoolUnlockingReward = _newSortitionPoolUnlockingReward;
        sortitionPoolUnlockingRewardChangeInitiated = block.timestamp;
        emit SortitionPoolUnlockingRewardUpdateStarted(
            _newSortitionPoolUnlockingReward,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the sortition pool unlocking reward update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeSortitionPoolUnlockingRewardUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(sortitionPoolUnlockingRewardChangeInitiated)
    {
        emit SortitionPoolUnlockingRewardUpdated(
            newSortitionPoolUnlockingReward
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRewardParameters(
            randomBeacon.dkgResultSubmissionReward(),
            newSortitionPoolUnlockingReward,
            randomBeacon.ineligibleOperatorNotifierReward(),
            randomBeacon.sortitionPoolRewardsBanDuration(),
            randomBeacon.relayEntryTimeoutNotificationRewardMultiplier(),
            randomBeacon.unauthorizedSigningNotificationRewardMultiplier(),
            randomBeacon.dkgMaliciousResultNotificationRewardMultiplier()
        );
        sortitionPoolUnlockingRewardChangeInitiated = 0;
        newSortitionPoolUnlockingReward = 0;
    }

    /// @notice Begins the ineligible operator notifier reward update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newIneligibleOperatorNotifierReward New ineligible operator
    ///        notifier reward.
    function beginIneligibleOperatorNotifierRewardUpdate(
        uint256 _newIneligibleOperatorNotifierReward
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newIneligibleOperatorNotifierReward = _newIneligibleOperatorNotifierReward;
        ineligibleOperatorNotifierRewardChangeInitiated = block.timestamp;
        emit IneligibleOperatorNotifierRewardUpdateStarted(
            _newIneligibleOperatorNotifierReward,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the ineligible operator notifier reward update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeIneligibleOperatorNotifierRewardUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            ineligibleOperatorNotifierRewardChangeInitiated
        )
    {
        emit IneligibleOperatorNotifierRewardUpdated(
            newIneligibleOperatorNotifierReward
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRewardParameters(
            randomBeacon.dkgResultSubmissionReward(),
            randomBeacon.sortitionPoolUnlockingReward(),
            newIneligibleOperatorNotifierReward,
            randomBeacon.sortitionPoolRewardsBanDuration(),
            randomBeacon.relayEntryTimeoutNotificationRewardMultiplier(),
            randomBeacon.unauthorizedSigningNotificationRewardMultiplier(),
            randomBeacon.dkgMaliciousResultNotificationRewardMultiplier()
        );
        ineligibleOperatorNotifierRewardChangeInitiated = 0;
        newIneligibleOperatorNotifierReward = 0;
    }

    /// @notice Begins the sortition pool rewards ban duration update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newSortitionPoolRewardsBanDuration New sortition pool rewards
    ///        ban duration.
    function beginSortitionPoolRewardsBanDurationUpdate(
        uint256 _newSortitionPoolRewardsBanDuration
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newSortitionPoolRewardsBanDuration = _newSortitionPoolRewardsBanDuration;
        sortitionPoolRewardsBanDurationChangeInitiated = block.timestamp;
        emit SortitionPoolRewardsBanDurationUpdateStarted(
            _newSortitionPoolRewardsBanDuration,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the sortition pool rewards ban duration update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeSortitionPoolRewardsBanDurationUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(sortitionPoolRewardsBanDurationChangeInitiated)
    {
        emit SortitionPoolRewardsBanDurationUpdated(
            newSortitionPoolRewardsBanDuration
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRewardParameters(
            randomBeacon.dkgResultSubmissionReward(),
            randomBeacon.sortitionPoolUnlockingReward(),
            randomBeacon.ineligibleOperatorNotifierReward(),
            newSortitionPoolRewardsBanDuration,
            randomBeacon.relayEntryTimeoutNotificationRewardMultiplier(),
            randomBeacon.unauthorizedSigningNotificationRewardMultiplier(),
            randomBeacon.dkgMaliciousResultNotificationRewardMultiplier()
        );
        sortitionPoolRewardsBanDurationChangeInitiated = 0;
        newSortitionPoolRewardsBanDuration = 0;
    }

    /// @notice Begins the relay entry timeout notification reward multiplier
    ///         update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newRelayEntryTimeoutNotificationRewardMultiplier New relay
    ///        entry timeout notification reward multiplier.
    function beginRelayEntryTimeoutNotificationRewardMultiplierUpdate(
        uint256 _newRelayEntryTimeoutNotificationRewardMultiplier
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        require(
            _newRelayEntryTimeoutNotificationRewardMultiplier <= 100,
            "Maximum value is 100"
        );

        newRelayEntryTimeoutNotificationRewardMultiplier = _newRelayEntryTimeoutNotificationRewardMultiplier;
        relayEntryTimeoutNotificationRewardMultiplierChangeInitiated = block
            .timestamp;
        emit RelayEntryTimeoutNotificationRewardMultiplierUpdateStarted(
            _newRelayEntryTimeoutNotificationRewardMultiplier,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Begins the unauthorized signing notification reward multiplier
    ///         update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newUnauthorizedSigningNotificationRewardMultiplier New unauthorized
    ///         signing notification reward multiplier.
    function beginUnauthorizedSigningNotificationRewardMultiplierUpdate(
        uint256 _newUnauthorizedSigningNotificationRewardMultiplier
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        require(
            _newUnauthorizedSigningNotificationRewardMultiplier <= 100,
            "Maximum value is 100"
        );

        newUnauthorizedSigningNotificationRewardMultiplier = _newUnauthorizedSigningNotificationRewardMultiplier;
        unauthorizedSigningNotificationRewardMultiplierChangeInitiated = block
            .timestamp;
        emit UnauthorizedSigningNotificationRewardMultiplierUpdateStarted(
            _newUnauthorizedSigningNotificationRewardMultiplier,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the unauthorized signing notification reward
    ///         multiplier update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeUnauthorizedSigningNotificationRewardMultiplierUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            unauthorizedSigningNotificationRewardMultiplierChangeInitiated
        )
    {
        emit UnauthorizedSigningNotificationRewardMultiplierUpdated(
            newUnauthorizedSigningNotificationRewardMultiplier
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRewardParameters(
            randomBeacon.dkgResultSubmissionReward(),
            randomBeacon.sortitionPoolUnlockingReward(),
            randomBeacon.ineligibleOperatorNotifierReward(),
            randomBeacon.sortitionPoolRewardsBanDuration(),
            randomBeacon.relayEntryTimeoutNotificationRewardMultiplier(),
            newUnauthorizedSigningNotificationRewardMultiplier,
            randomBeacon.dkgMaliciousResultNotificationRewardMultiplier()
        );
        unauthorizedSigningNotificationRewardMultiplierChangeInitiated = 0;
        newUnauthorizedSigningNotificationRewardMultiplier = 0;
    }

    /// @notice Finalizes the relay entry timeout notification reward
    ///         multiplier update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeRelayEntryTimeoutNotificationRewardMultiplierUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            relayEntryTimeoutNotificationRewardMultiplierChangeInitiated
        )
    {
        emit RelayEntryTimeoutNotificationRewardMultiplierUpdated(
            newRelayEntryTimeoutNotificationRewardMultiplier
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRewardParameters(
            randomBeacon.dkgResultSubmissionReward(),
            randomBeacon.sortitionPoolUnlockingReward(),
            randomBeacon.ineligibleOperatorNotifierReward(),
            randomBeacon.sortitionPoolRewardsBanDuration(),
            newRelayEntryTimeoutNotificationRewardMultiplier,
            randomBeacon.unauthorizedSigningNotificationRewardMultiplier(),
            randomBeacon.dkgMaliciousResultNotificationRewardMultiplier()
        );
        relayEntryTimeoutNotificationRewardMultiplierChangeInitiated = 0;
        newRelayEntryTimeoutNotificationRewardMultiplier = 0;
    }

    /// @notice Begins the DKG malicious result notification reward multiplier
    ///         update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newDkgMaliciousResultNotificationRewardMultiplier New DKG
    ///        malicious result notification reward multiplier.
    function beginDkgMaliciousResultNotificationRewardMultiplierUpdate(
        uint256 _newDkgMaliciousResultNotificationRewardMultiplier
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        require(
            _newDkgMaliciousResultNotificationRewardMultiplier <= 100,
            "Maximum value is 100"
        );

        newDkgMaliciousResultNotificationRewardMultiplier = _newDkgMaliciousResultNotificationRewardMultiplier;
        dkgMaliciousResultNotificationRewardMultiplierChangeInitiated = block
            .timestamp;
        emit DkgMaliciousResultNotificationRewardMultiplierUpdateStarted(
            _newDkgMaliciousResultNotificationRewardMultiplier,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the DKG malicious result notification reward
    ///         multiplier update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeDkgMaliciousResultNotificationRewardMultiplierUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            dkgMaliciousResultNotificationRewardMultiplierChangeInitiated
        )
    {
        emit DkgMaliciousResultNotificationRewardMultiplierUpdated(
            newDkgMaliciousResultNotificationRewardMultiplier
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateRewardParameters(
            randomBeacon.dkgResultSubmissionReward(),
            randomBeacon.sortitionPoolUnlockingReward(),
            randomBeacon.ineligibleOperatorNotifierReward(),
            randomBeacon.sortitionPoolRewardsBanDuration(),
            randomBeacon.relayEntryTimeoutNotificationRewardMultiplier(),
            randomBeacon.unauthorizedSigningNotificationRewardMultiplier(),
            newDkgMaliciousResultNotificationRewardMultiplier
        );
        dkgMaliciousResultNotificationRewardMultiplierChangeInitiated = 0;
        newDkgMaliciousResultNotificationRewardMultiplier = 0;
    }

    /// @notice Begins the relay entry submission failure slashing amount update
    ///         process.
    /// @dev Can be called only by the contract owner.
    /// @param _newRelayEntrySubmissionFailureSlashingAmount New relay entry
    ///        submission failure slashing amount
    function beginRelayEntrySubmissionFailureSlashingAmountUpdate(
        uint256 _newRelayEntrySubmissionFailureSlashingAmount
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newRelayEntrySubmissionFailureSlashingAmount = _newRelayEntrySubmissionFailureSlashingAmount;
        relayEntrySubmissionFailureSlashingAmountChangeInitiated = block
            .timestamp;
        emit RelayEntrySubmissionFailureSlashingAmountUpdateStarted(
            _newRelayEntrySubmissionFailureSlashingAmount,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the relay entry submission failure slashing amount
    ///         update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeRelayEntrySubmissionFailureSlashingAmountUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            relayEntrySubmissionFailureSlashingAmountChangeInitiated
        )
    {
        emit RelayEntrySubmissionFailureSlashingAmountUpdated(
            newRelayEntrySubmissionFailureSlashingAmount
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateSlashingParameters(
            newRelayEntrySubmissionFailureSlashingAmount,
            randomBeacon.maliciousDkgResultSlashingAmount(),
            randomBeacon.unauthorizedSigningSlashingAmount()
        );
        relayEntrySubmissionFailureSlashingAmountChangeInitiated = 0;
        newRelayEntrySubmissionFailureSlashingAmount = 0;
    }

    /// @notice Begins the DKG approval gas offset update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newDkgApprovalGasOffset New DKG approval gas offset
    function beginDkgApprovalGasOffsetUpdate(uint256 _newDkgApprovalGasOffset)
        external
        onlyOwner
    {
        /* solhint-disable not-rely-on-time */
        newDkgApprovalGasOffset = _newDkgApprovalGasOffset;
        dkgApprovalGasOffsetChangeInitiated = block.timestamp;
        emit DkgApprovalGasOffsetUpdateStarted(
            _newDkgApprovalGasOffset,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the DKG approval gas offset update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeDkgApprovalGasOffsetAmountUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(dkgApprovalGasOffsetChangeInitiated)
    {
        emit DkgApprovalGasOffsetUpdated(newDkgApprovalGasOffset);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateGasOffsets(
            newDkgApprovalGasOffset,
            randomBeacon.failedHeartbeatGasOffset(),
            randomBeacon.relayEntrySubmissionGasOffset()
        );
        dkgApprovalGasOffsetChangeInitiated = 0;
        newDkgApprovalGasOffset = 0;
    }

    /// @notice Begins the failed heartbeat gas offset update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newFailedHeartbeatGasOffset New failed heartbeat gas offset
    function beginFailedHeartbeatGasOffsetUpdate(
        uint256 _newFailedHeartbeatGasOffset
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newFailedHeartbeatGasOffset = _newFailedHeartbeatGasOffset;
        failedHeartbeatGasOffsetChangeInitiated = block.timestamp;
        emit FailedHeartbeatGasOffsetUpdateStarted(
            _newFailedHeartbeatGasOffset,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes failed heartbeat gas offset update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeFailedHeartbeatGasOffsetUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(failedHeartbeatGasOffsetChangeInitiated)
    {
        emit FailedHeartbeatGasOffsetUpdated(newFailedHeartbeatGasOffset);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateGasOffsets(
            randomBeacon.dkgApprovalGasOffset(),
            newFailedHeartbeatGasOffset,
            randomBeacon.relayEntrySubmissionGasOffset()
        );
        failedHeartbeatGasOffsetChangeInitiated = 0;
        newFailedHeartbeatGasOffset = 0;
    }

    /// @notice Begins the relay entry submission gas offset update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newRelayEntrySubmissionGasOffset New relay entry submission gas offset
    function beginRelayEntrySubmissionGasOffsetUpdate(
        uint256 _newRelayEntrySubmissionGasOffset
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newRelayEntrySubmissionGasOffset = _newRelayEntrySubmissionGasOffset;
        relayEntrySubmissionGasOffsetChangeInitiated = block.timestamp;
        emit RelayEntrySubmissionGasOffsetUpdateStarted(
            _newRelayEntrySubmissionGasOffset,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes relay entry submission gas offset update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeRelayEntrySubmissionGasOffsetUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(relayEntrySubmissionGasOffsetChangeInitiated)
    {
        emit RelayEntrySubmissionGasOffsetUpdated(
            newRelayEntrySubmissionGasOffset
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateGasOffsets(
            randomBeacon.dkgApprovalGasOffset(),
            randomBeacon.failedHeartbeatGasOffset(),
            newRelayEntrySubmissionGasOffset
        );
        relayEntrySubmissionGasOffsetChangeInitiated = 0;
        newRelayEntrySubmissionGasOffset = 0;
    }

    /// @notice Begins the dkg result submission gas update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newDkgResultSubmissionGas New relay entry submission gas offset
    function beginDkgResultSubmissionGasUpdate(
        uint256 _newDkgResultSubmissionGas
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newDkgResultSubmissionGas = _newDkgResultSubmissionGas;
        dkgResultSubmissionGasChangeInitiated = block.timestamp;
        emit DkgResultSubmissionGasUpdateStarted(
            _newDkgResultSubmissionGas,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes dkg result submission gas update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeDkgResultSubmissionGasUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(dkgResultSubmissionGasChangeInitiated)
    {
        emit DkgResultSubmissionGasUpdated(newDkgResultSubmissionGas);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateDkgResultSubmissionGas(newDkgResultSubmissionGas);
        dkgResultSubmissionGasChangeInitiated = 0;
        newDkgResultSubmissionGas = 0;
    }

    /// @notice Begins the malicious DKG result slashing amount update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newMaliciousDkgResultSlashingAmount New malicious DKG result
    ///        slashing amount
    function beginMaliciousDkgResultSlashingAmountUpdate(
        uint256 _newMaliciousDkgResultSlashingAmount
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newMaliciousDkgResultSlashingAmount = _newMaliciousDkgResultSlashingAmount;
        maliciousDkgResultSlashingAmountChangeInitiated = block.timestamp;
        emit MaliciousDkgResultSlashingAmountUpdateStarted(
            _newMaliciousDkgResultSlashingAmount,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the malicious DKG result slashing amount update
    ///         process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeMaliciousDkgResultSlashingAmountUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            maliciousDkgResultSlashingAmountChangeInitiated
        )
    {
        emit MaliciousDkgResultSlashingAmountUpdated(
            newMaliciousDkgResultSlashingAmount
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateSlashingParameters(
            randomBeacon.relayEntrySubmissionFailureSlashingAmount(),
            newMaliciousDkgResultSlashingAmount,
            randomBeacon.unauthorizedSigningSlashingAmount()
        );
        maliciousDkgResultSlashingAmountChangeInitiated = 0;
        newMaliciousDkgResultSlashingAmount = 0;
    }

    /// @notice Begins the unauthorized signing slashing amount update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newUnauthorizedSigningSlashingAmount New unauthorized signing
    ///        slashing amount
    function beginUnauthorizedSigningSlashingAmountUpdate(
        uint256 _newUnauthorizedSigningSlashingAmount
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newUnauthorizedSigningSlashingAmount = _newUnauthorizedSigningSlashingAmount;
        unauthorizedSigningSlashingAmountChangeInitiated = block.timestamp;
        emit UnauthorizedSigningSlashingAmountUpdateStarted(
            _newUnauthorizedSigningSlashingAmount,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the unauthorized signing slashing amount update
    ///         process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeUnauthorizedSigningSlashingAmountUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(
            unauthorizedSigningSlashingAmountChangeInitiated
        )
    {
        emit UnauthorizedSigningSlashingAmountUpdated(
            newUnauthorizedSigningSlashingAmount
        );
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateSlashingParameters(
            randomBeacon.relayEntrySubmissionFailureSlashingAmount(),
            randomBeacon.maliciousDkgResultSlashingAmount(),
            newUnauthorizedSigningSlashingAmount
        );
        unauthorizedSigningSlashingAmountChangeInitiated = 0;
        newUnauthorizedSigningSlashingAmount = 0;
    }

    /// @notice Begins the minimum authorization amount update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newMinimumAuthorization New minimum authorization amount.
    function beginMinimumAuthorizationUpdate(uint96 _newMinimumAuthorization)
        external
        onlyOwner
    {
        /* solhint-disable not-rely-on-time */
        newMinimumAuthorization = _newMinimumAuthorization;
        minimumAuthorizationChangeInitiated = block.timestamp;
        emit MinimumAuthorizationUpdateStarted(
            _newMinimumAuthorization,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the minimum authorization amount update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeMinimumAuthorizationUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(minimumAuthorizationChangeInitiated)
    {
        emit MinimumAuthorizationUpdated(newMinimumAuthorization);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateAuthorizationParameters(
            newMinimumAuthorization,
            randomBeacon.authorizationDecreaseDelay()
        );
        minimumAuthorizationChangeInitiated = 0;
        newMinimumAuthorization = 0;
    }

    /// @notice Begins the authorization decrease delay update process.
    /// @dev Can be called only by the contract owner.
    /// @param _newAuthorizationDecreaseDelay New authorization decrease delay
    function beginAuthorizationDecreaseDelayUpdate(
        uint64 _newAuthorizationDecreaseDelay
    ) external onlyOwner {
        /* solhint-disable not-rely-on-time */
        newAuthorizationDecreaseDelay = _newAuthorizationDecreaseDelay;
        authorizationDecreaseDelayChangeInitiated = block.timestamp;
        emit AuthorizationDecreaseDelayUpdateStarted(
            _newAuthorizationDecreaseDelay,
            block.timestamp
        );
        /* solhint-enable not-rely-on-time */
    }

    /// @notice Finalizes the authorization decrease delay update process.
    /// @dev Can be called only by the contract owner, after the governance
    ///      delay elapses.
    function finalizeAuthorizationDecreaseDelayUpdate()
        external
        onlyOwner
        onlyAfterGovernanceDelay(authorizationDecreaseDelayChangeInitiated)
    {
        emit AuthorizationDecreaseDelayUpdated(newAuthorizationDecreaseDelay);
        // slither-disable-next-line reentrancy-no-eth
        randomBeacon.updateAuthorizationParameters(
            randomBeacon.minimumAuthorization(),
            newAuthorizationDecreaseDelay
        );
        authorizationDecreaseDelayChangeInitiated = 0;
        newAuthorizationDecreaseDelay = 0;
    }

    /// @notice Authorize contract which can request a relay entry without
    ///         paying fees.
    function authorizeContract(address _contract) external onlyOwner {
        randomBeacon.authorizeContract(_contract);
    }

    /// @notice Unauthorize contract which can request a relay entry without
    ///         paying fees.
    function unauthorizeContract(address _contract) external onlyOwner {
        randomBeacon.unauthorizeContract(_contract);
    }

    /// @notice Withdraws rewards belonging to operators marked as ineligible
    ///         for sortition pool rewards.
    /// @dev Can be called only by the contract owner.
    /// @param recipient Recipient of withdrawn rewards.
    function withdrawIneligibleRewards(address recipient) external onlyOwner {
        randomBeacon.withdrawIneligibleRewards(recipient);
    }

    /// @notice Get the time remaining until the governance delay can be updated.
    /// @return Remaining time in seconds.
    function getRemainingGovernanceDelayUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(governanceDelayChangeInitiated);
    }

    /// @notice Get the time remaining until the random beacon ownership can
    ///         be transferred.
    /// @return Remaining time in seconds.
    function getRemainingRandomBeaconOwnershipTransferDelayTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(randomBeaconOwnershipTransferInitiated);
    }

    /// @notice Get the time remaining until the relay request fee can be
    ///         updated.
    /// @return Remaining time in seconds.
    function getRemainingRelayRequestFeeUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(relayRequestFeeChangeInitiated);
    }

    /// @notice Get the time remaining until the relay entry submission soft
    ///         timeout can be updated.
    /// @return Remaining time in seconds.
    function getRemainingRelayEntrySoftTimeoutUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(relayEntrySoftTimeoutChangeInitiated);
    }

    /// @notice Get the time remaining until the relay entry hard timeout can be
    ///         updated.
    /// @return Remaining time in seconds.
    function getRemainingRelayEntryHardTimeoutUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(relayEntryHardTimeoutChangeInitiated);
    }

    /// @notice Get the time remaining until the callback gas limit can be
    ///         updated.
    /// @return Remaining time in seconds.
    function getRemainingCallbackGasLimitUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(callbackGasLimitChangeInitiated);
    }

    /// @notice Get the time remaining until the group creation frequency can be
    ///         updated.
    /// @return Remaining time in seconds.
    function getRemainingGroupCreationFrequencyUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(groupCreationFrequencyChangeInitiated);
    }

    /// @notice Get the time remaining until the group lifetime can be updated.
    /// @return Remaining time in seconds.
    function getRemainingGroupLifetimeUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(groupLifetimeChangeInitiated);
    }

    /// @notice Get the time remaining until the DKG result challenge period
    ///         length can be updated.
    /// @return Remaining time in seconds.
    function getRemainingDkgResultChallengePeriodLengthUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                dkgResultChallengePeriodLengthChangeInitiated
            );
    }

    /// @notice Get the time remaining until the DKG result submission timeout
    ///         can be updated.
    /// @return Remaining time in seconds.
    function getRemainingDkgResultSubmissionTimeoutUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(dkgResultSubmissionTimeoutChangeInitiated);
    }

    /// @notice Get the time remaining until the wallet owner can be updated.
    /// @return Remaining time in seconds.
    function getRemainingDkgSubmitterPrecedencePeriodLengthUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                dkgSubmitterPrecedencePeriodLengthChangeInitiated
            );
    }

    /// @notice Get the time remaining until the DKG result submission reward
    ///         can be updated.
    /// @return Remaining time in seconds.
    function getRemainingDkgResultSubmissionRewardUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(dkgResultSubmissionRewardChangeInitiated);
    }

    /// @notice Get the time remaining until the sortition pool unlocking reward
    ///         can be updated.
    /// @return Remaining time in seconds.
    function getRemainingSortitionPoolUnlockingRewardUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(sortitionPoolUnlockingRewardChangeInitiated);
    }

    /// @notice Get the time remaining until the ineligible operator notifier
    ///         reward can be updated.
    /// @return Remaining time in seconds.
    function getRemainingIneligibleOperatorNotifierRewardUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                ineligibleOperatorNotifierRewardChangeInitiated
            );
    }

    /// @notice Get the time remaining until the relay entry submission failure
    ///         slashing amount can be updated.
    /// @return Remaining time in seconds.
    function getRemainingRelayEntrySubmissionFailureSlashingAmountUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                relayEntrySubmissionFailureSlashingAmountChangeInitiated
            );
    }

    /// @notice Get the time remaining until the malicious DKG result
    ///         slashing amount can be updated.
    /// @return Remaining time in seconds.
    function getRemainingMaliciousDkgResultSlashingAmountUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                maliciousDkgResultSlashingAmountChangeInitiated
            );
    }

    /// @notice Get the time remaining until the unauthorized signing
    ///         slashing amount can be updated.
    /// @return Remaining time in seconds.
    function getRemainingUnauthorizedSigningSlashingAmountUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                unauthorizedSigningSlashingAmountChangeInitiated
            );
    }

    /// @notice Get the time remaining until the minimum authorization amount
    ///         can be updated.
    /// @return Remaining time in seconds.
    function getRemainingMimimumAuthorizationUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(minimumAuthorizationChangeInitiated);
    }

    function getRemainingAuthorizationDecreaseDelayUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(authorizationDecreaseDelayChangeInitiated);
    }

    /// @notice Get the time remaining until the sortition pool rewards ban
    ///         duration can be updated.
    /// @return Remaining time in seconds.
    function getRemainingSortitionPoolRewardsBanDurationUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                sortitionPoolRewardsBanDurationChangeInitiated
            );
    }

    /// @notice Get the time remaining until the relay entry timeout
    ///         notification reward multiplier duration can be updated.
    /// @return Remaining time in seconds.
    function getRemainingRelayEntryTimeoutNotificationRewardMultiplierUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                relayEntryTimeoutNotificationRewardMultiplierChangeInitiated
            );
    }

    /// @notice Get the time remaining until the unauthorized signing
    ///         notification reward multiplier duration can be updated.
    /// @return Remaining time in seconds.
    function getRemainingUnauthorizedSigningNotificationRewardMultiplierUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                unauthorizedSigningNotificationRewardMultiplierChangeInitiated
            );
    }

    /// @notice Get the time remaining until the DKG malicious result
    ///         notification reward multiplier duration can be updated.
    /// @return Remaining time in seconds.
    function getRemainingDkgMaliciousResultNotificationRewardMultiplierUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                dkgMaliciousResultNotificationRewardMultiplierChangeInitiated
            );
    }

    /// @notice Get the time remaining until the DKG approval gas offset duration
    ///         can be updated.
    /// @return Remaining time in seconds.
    function getDkgApprovalGasOffsetUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(dkgApprovalGasOffsetChangeInitiated);
    }

    /// @notice Get the time remaining until the failed heartbeat gas offset duration
    ///         can be updated.
    /// @return Remaining time in seconds.
    function getFailedHeartbeatGasOffsetUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(failedHeartbeatGasOffsetChangeInitiated);
    }

    /// @notice Get the time remaining until the relay entry submission gas offset
    ///         duration can be updated.
    /// @return Remaining time in seconds.
    function getRelayEntrySubmissionGasOffsetUpdateTime()
        external
        view
        returns (uint256)
    {
        return
            getRemainingChangeTime(
                relayEntrySubmissionGasOffsetChangeInitiated
            );
    }

    /// @notice Get the time remaining until the DKG result submission gas
    ///         duration can be updated.
    /// @return Remaining time in seconds.
    function getDkgResultSubmissionGasUpdateTime()
        external
        view
        returns (uint256)
    {
        return getRemainingChangeTime(dkgResultSubmissionGasChangeInitiated);
    }

    /// @notice Gets the time remaining until the governable parameter update
    ///         can be committed.
    /// @param changeTimestamp Timestamp indicating the beginning of the change.
    /// @return Remaining time in seconds.
    function getRemainingChangeTime(uint256 changeTimestamp)
        internal
        view
        returns (uint256)
    {
        require(changeTimestamp > 0, "Change not initiated");
        /* solhint-disable-next-line not-rely-on-time */
        uint256 elapsed = block.timestamp - changeTimestamp;
        if (elapsed >= governanceDelay) {
            return 0;
        } else {
            return governanceDelay - elapsed;
        }
    }
}
