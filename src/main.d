import std.stdio;

import cards;

void main()
{
    writeln("Hello World");
    foreach(r ; Rank.min..Rank.max) {
        writeln(r);
    }
    auto c = Card(Rank.Ten, Suit.Clubs);
    writeln(c.toString());

    auto h = new Hand();
    auto new_hand = new Hand(h);
    h.add(c);
    writeln(h);
}
