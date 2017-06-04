import std.string;

enum Rank {
    Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}

enum Suit {
    Hearts, Clubs, Diamonds, Spades
}

struct Card {
    Rank rank;
    Suit suit;

    string toString() {
        return format("%s of %s", rank, suit);
    }
}

class Hand {
private:
    Card[] cards;
    const int hand_size = 5;
    int card_count;

public:
    this() {
        cards = new Card[hand_size];
        card_count = 0;
    }

    this(Hand hand) {
        this.cards = hand.cards.dup;
        this.card_count = hand.card_count;
    }

    bool isFull() {
        bool full = false;
        if (card_count >= hand_size) {
            full = true;
        }
        return full;
    }

    void add(Card c) {
        if (!isFull()) {
            cards[card_count] = c;
            card_count++;
        }
    }

    override string toString() {
        string output = "{";
        foreach(i ; 0..card_count) {
            output = format("%s%s", output, cards[i].toString());
            if (i != card_count-1) {
                output = format("%s, ", output);
            }
        }
        output = format("%s}", output);
        return output;
    }
}

void generateAllHands(Card[] deck, ref Hand hand, Hand[] all_hands) {
}
