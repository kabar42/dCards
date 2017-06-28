import cards;

enum HandType {
    NoPair,
    OnePair,
    TwoPair,
    ThreeOfAKind,
    Straight,
    Flush,
    FullHouse,
    FourOfAKind,
    StraightFlush,
    RoyalFlush
}

const int HAND_TYPES_COUNT = 10;

struct HandData {
    int[SUIT_COUNT] suit_count;
    int[RANK_COUNT] rank_count;
}

int[HandType] count_hand_types(Hand[] all_hands) {
    int[HandType] type_counts;
    foreach(h ; all_hands) {
        HandData data = get_hand_data(h);
        // HandType hand_type = determine_hand_type(data);
        // type_counts[hand_type] += 1
    }
    return type_counts;
}

HandData get_hand_data(Hand hand) {
    HandData data = HandData();
    foreach(c ; hand.cards) {
        data.suit_count[int(c.suit)] += 1;
        data.rank_count[int(c.rank)] += 1;
    }
    return data;
}

Rank[] get_ranks_present(int[] counts) {
    auto ranksPresent = new Rank[0];
    foreach(i ; counts) {
        if(counts[i] > 0) {
            auto new_rank = new Rank[1];
            new_rank[0] = intToRank(i);
            ranksPresent ~= new_rank;
        }
    }
    return ranksPresent;
}

bool ranksAreSequential(Rank[] ranks) {
    if(ranks.length < Hand.hand_size) {
        return false;
    }

    // ranks.sort();

    if(ranks[0] == Rank.Ace &&
       ranks[1] == Rank.Ten &&
       ranks[2] == Rank.Jack &&
       ranks[3] == Rank.Queen &&
       ranks[4] == Rank.King) {
        return true;
    }

    foreach(i ; ranks[1..$]) {
        auto prevRank = int(ranks[i-1]);
        auto thisRank = int(ranks[i]);
        if(prevRank != thisRank-1) {
            return false;
        }
    }

    return true;
}

