import std.stdio;
import std.string;
import std.traits;

enum Rank {
    Ace = 0, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Invalid
}

const int RANK_COUNT = 13;

int opCmp(ref const Rank me, ref const Rank r) {
    int result = 0;
    if(int(me) < int(r)) {
        result = -1;
    } else if(int(me) > int(r)) {
        result = 1;
    }
    return result;
}

Rank intToRank(int r) {
    auto result = Rank.Invalid;
    switch(r) {
        case 0:
            result = Rank.Ace;
            break;
        case 1:
            result = Rank.Two;
            break;
        case 2:
            result = Rank.Three;
            break;
        case 3:
            result = Rank.Four;
            break;
        case 4:
            result = Rank.Five;
            break;
        case 5:
            result = Rank.Six;
            break;
        case 6:
            result = Rank.Seven;
            break;
        case 7:
            result = Rank.Eight;
            break;
        case 8:
            result = Rank.Nine;
            break;
        case 9:
            result = Rank.Ten;
            break;
        case 10:
            result = Rank.Jack;
            break;
        case 11:
            result = Rank.Queen;
            break;
        case 12:
            result = Rank.King;
            break;
        default:
            break;
    }
    return result;
}

enum Suit {
    Hearts, Clubs, Diamonds, Spades
}

const int SUIT_COUNT = 4;

struct Card {
    Rank rank;
    Suit suit;

    string toString() {
        return format("%s of %s", rank, suit);
    }
}

Card[] createStandardDeck() {
    Card[] deck = new Card[0];
    foreach(immutable s ; [EnumMembers!Suit]) {
        foreach(immutable r ; [EnumMembers!Rank]) {
            Card[] new_card = new Card[1];
            new_card[0] = Card(r, s);
            deck ~= new_card;
        }
    }
    return deck;
}

class Hand {
private:
    int card_count;

public:
    static int hand_size = 5;
    Card[] cards;

    this() {
        cards = new Card[hand_size];
        card_count = 0;
    }

    this(Hand hand) {
        this.cards = hand.cards.dup;
        this.card_count = hand.card_count;
    }

    bool isFull() const {
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

void generateAllHands(Card[] deck, ref Hand hand, ref Hand[] all_hands) {
    if (hand.isFull()) {
        Hand[] new_hands = new Hand[1];
        new_hands[0] = hand;
        all_hands ~= new_hands;
    } else if (deck.length > 0) {
        Hand new_hand = new Hand(hand);
        new_hand.add(deck[0]);
        generateAllHands(deck[1..$], new_hand, all_hands);
        generateAllHands(deck[1..$], hand, all_hands);
    }
}
