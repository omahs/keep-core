package groupselection

import (
	"math/big"
	"testing"

	"github.com/keep-network/keep-core/pkg/beacon/relay/chain"
	"github.com/keep-network/keep-core/pkg/beacon/relay/config"
	"github.com/keep-network/keep-core/pkg/beacon/relay/event"
	"github.com/keep-network/keep-core/pkg/chain/local"
	"github.com/keep-network/keep-core/pkg/gen/async"
	"github.com/keep-network/keep-core/pkg/subscription"
)

func TestSubmission(t *testing.T) {
	var tests = map[string]struct {
		groupSize                     int
		initialSubmissionTickets      []*ticket
		reactiveSubmissionTickets     []*ticket
		expectedSubmittedTicketsCount int
	}{
		// Enough tickets submitted in the initial submission phase to form
		// a new group. Reactive ticket submission should not be executed.
		"only initial submission - the same number of tickets as group size": {
			groupSize: 4,
			initialSubmissionTickets: []*ticket{
				newTestTicket(1, 1001),
				newTestTicket(2, 1002),
				newTestTicket(3, 1003),
				newTestTicket(4, 1004),
			},
			reactiveSubmissionTickets: []*ticket{
				newTestTicket(5, 1005),
				newTestTicket(6, 1006),
			},
			expectedSubmittedTicketsCount: 4,
		},
		// Enough tickets submitted in the initial submission phase to form
		// a new group. Reactive ticket submission should not be executed.
		"only initial submission - more tickets than group size": {
			groupSize: 2,
			initialSubmissionTickets: []*ticket{
				newTestTicket(1, 1001),
				newTestTicket(2, 1002),
				newTestTicket(3, 1003),
				newTestTicket(4, 1004),
			},
			reactiveSubmissionTickets: []*ticket{
				newTestTicket(5, 1005),
				newTestTicket(6, 1006),
			},
			expectedSubmittedTicketsCount: 4,
		},
		// Not enough tickets submitted in the initial submission phase to form
		// a new group. Reactive ticket submission should be executed.
		"with reactive submission phase": {
			groupSize: 6,
			initialSubmissionTickets: []*ticket{
				newTestTicket(1, 1001),
				newTestTicket(2, 1002),
				newTestTicket(3, 1003),
				newTestTicket(4, 1004),
			},
			reactiveSubmissionTickets: []*ticket{
				newTestTicket(5, 1005),
				newTestTicket(6, 1006),
			},
			expectedSubmittedTicketsCount: 6,
		},
	}

	for _, test := range tests {
		chainConfig := &config.Chain{
			GroupSize:                       test.groupSize,
			TicketInitialSubmissionTimeout:  3,
			TicketReactiveSubmissionTimeout: 5,
		}

		chain := &stubGroupInterface{
			groupSize: test.groupSize,
		}

		blockCounter, err := local.BlockCounter()
		if err != nil {
			t.Fatal(err)
		}

		onGroupSelected := func(result *Result) {}

		err = startTicketSubmission(
			test.initialSubmissionTickets,
			test.reactiveSubmissionTickets,
			chain,
			blockCounter,
			chainConfig,
			0, // start block height
			onGroupSelected,
		)
		if err != nil {
			t.Fatal(err)
		}

		err = blockCounter.WaitForBlockHeight(
			chainConfig.TicketReactiveSubmissionTimeout,
		)
		if err != nil {
			t.Fatal(err)
		}

		submittedTicketsCount, err := chain.GetSubmittedTicketsCount()
		if err != nil {
			t.Fatal(err)
		}

		expectedCount := big.NewInt(int64(test.expectedSubmittedTicketsCount))
		if expectedCount.Cmp(submittedTicketsCount) != 0 {
			t.Fatalf(
				"unexpected number of submitted tickets\nexpected: [%v]\nactual:   [%v]",
				expectedCount,
				submittedTicketsCount,
			)
		}
	}
}

type stubGroupInterface struct {
	groupSize        int
	submittedTickets []*chain.Ticket
}

func (stg *stubGroupInterface) SubmitTicket(ticket *chain.Ticket) *async.GroupTicketPromise {
	stg.submittedTickets = append(stg.submittedTickets, ticket)
	promise := &async.GroupTicketPromise{}

	promise.Fulfill(&event.GroupTicketSubmission{
		TicketValue: ticket.Value,
		BlockNumber: 222,
	})

	return promise
}

func (stg *stubGroupInterface) GetSubmittedTicketsCount() (*big.Int, error) {
	return big.NewInt(int64(len(stg.submittedTickets))), nil
}

func (stg *stubGroupInterface) GetSelectedParticipants() ([]chain.StakerAddress, error) {
	selected := make([]chain.StakerAddress, stg.groupSize)
	for i := 0; i < stg.groupSize; i++ {
		selected[i] = []byte("whatever")
	}

	return selected, nil
}

func (stg *stubGroupInterface) OnGroupSelectionStarted(
	func(groupSelectionStart *event.GroupSelectionStart),
) (subscription.EventSubscription, error) {
	panic("not implemented")
}
