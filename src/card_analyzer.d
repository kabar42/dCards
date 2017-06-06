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

struct HandData {
    int[4] suit_count;
    int[13] rank_count;
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
