import std.stdio;

import cards;

void main()
{
    auto deck = createStandardDeck();
    auto h = new Hand();
    auto all_hands = new Hand[0];

    generateAllHands(deck, h, all_hands);

    writeln("Hand count: ", all_hands.length);
}
