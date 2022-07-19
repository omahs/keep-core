package dkg

import (
	"fmt"
	"github.com/keep-network/keep-core/pkg/crypto/ephemeral"
	"github.com/keep-network/keep-core/pkg/protocol/group"
)

// GenerateEphemeralKeyPair takes the group member list and generates an
// ephemeral ECDH keypair for every other group member. Generated public
// ephemeral keys are broadcasted within the group.
func (ekpgm *ephemeralKeyPairGeneratingMember) generateEphemeralKeyPair() (
	*ephemeralPublicKeyMessage,
	error,
) {
	ephemeralKeys := make(map[group.MemberIndex]*ephemeral.PublicKey)

	// Calculate ephemeral key pair for every other group member
	for _, member := range ekpgm.group.MemberIDs() {
		if member == ekpgm.id {
			// don’t actually generate a key with ourselves
			continue
		}

		ephemeralKeyPair, err := ephemeral.GenerateKeyPair()
		if err != nil {
			return nil, err
		}

		// save the generated ephemeral key to our state
		ekpgm.ephemeralKeyPairs[member] = ephemeralKeyPair

		// store the public key to the map for the message
		ephemeralKeys[member] = ephemeralKeyPair.PublicKey
	}

	return &ephemeralPublicKeyMessage{
		senderID:            ekpgm.id,
		ephemeralPublicKeys: ephemeralKeys,
	}, nil
}

// GenerateSymmetricKeys attempts to generate symmetric keys for all remote group
// members via ECDH. It generates this symmetric key for each remote group member
// by doing an ECDH between the ephemeral private key generated for a remote
// group member, and the public key for this member, generated and broadcasted by
// the remote group member.
func (skgm *symmetricKeyGeneratingMember) generateSymmetricKeys(
	ephemeralPubKeyMessages []*ephemeralPublicKeyMessage,
) error {
	for _, ephemeralPubKeyMessage := range ephemeralPubKeyMessages {
		otherMember := ephemeralPubKeyMessage.senderID

		// TODO: What should we do with that?
		if !skgm.isValidEphemeralPublicKeyMessage(ephemeralPubKeyMessage) {
			logger.Warningf(
				"[member:%v] member [%v] disqualified because of "+
					"sending invalid ephemeral public key message",
				skgm.id,
				otherMember,
			)
			skgm.group.MarkMemberAsDisqualified(otherMember)
			continue
		}

		// Find the ephemeral key pair generated by this group member for
		// the other group member.
		ephemeralKeyPair, ok := skgm.ephemeralKeyPairs[otherMember]
		if !ok {
			return fmt.Errorf(
				"ephemeral key pair does not exist for member %v",
				otherMember,
			)
		}

		// Get the ephemeral private key generated by this group member for
		// the other group member.
		thisMemberEphemeralPrivateKey := ephemeralKeyPair.PrivateKey

		// Get the ephemeral public key broadcasted by the other group member,
		// which was intended for this group member.
		otherMemberEphemeralPublicKey :=
			ephemeralPubKeyMessage.ephemeralPublicKeys[skgm.id]

		// Create symmetric key for the current group member and the other
		// group member by ECDH'ing the public and private key.
		symmetricKey := thisMemberEphemeralPrivateKey.Ecdh(
			otherMemberEphemeralPublicKey,
		)
		skgm.symmetricKeys[otherMember] = symmetricKey
	}

	return nil
}

// isValidEphemeralPublicKeyMessage validates a given EphemeralPublicKeyMessage.
// Message is considered valid if it contains ephemeral public keys for
// all other group members.
func (skgm *symmetricKeyGeneratingMember) isValidEphemeralPublicKeyMessage(
	message *ephemeralPublicKeyMessage,
) bool {
	for _, memberID := range skgm.group.MemberIDs() {
		if memberID == message.senderID {
			// Message contains ephemeral public keys only for other group members
			continue
		}

		if _, ok := message.ephemeralPublicKeys[memberID]; !ok {
			logger.Warningf(
				"[member:%v] ephemeral public key message from member [%v] "+
					"does not contain public key for member [%v]",
				skgm.id,
				message.senderID,
				memberID,
			)
			return false
		}
	}

	return true
}
