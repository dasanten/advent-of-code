import '../utils.dart';

bool isPartTwo = false;

class CardSet {
  CardSet(this.cards, this.bid);

  final List<CardValue> cards;
  final int bid;

  factory CardSet.fromString(String encoded) {
    final splittedString = encoded.split(' ');
    final cardsString = splittedString[0].split('');
    final bidString = splittedString[1];

    return CardSet(
        cardsString.map((e) => e.value).toList(), int.parse(bidString));
  }

  CardSetValue get value {
    final amounts = Map.fromIterable(
      CardValue.values,
      value: (type) => cards.amount((element) => type == element),
    );
    final values = amounts.values.toList();
    if (values.any((element) => element == 5)) return CardSetValue.five;
    if (values.any((element) => element == 4)) return CardSetValue.four;
    int pairs = values.amount(
      (element) => element == 2,
    );
    int triplets = values.amount(
      (element) => element == 3,
    );
    if (pairs == 1 && triplets == 1) return CardSetValue.fullHouse;
    if (triplets == 1) return CardSetValue.three;
    if (pairs == 2) return CardSetValue.twoPair;
    if (pairs == 1) return CardSetValue.pair;
    return CardSetValue.high;
  }

  CardValue get first => cards.first;
}

enum CardSetValue { five, four, fullHouse, three, twoPair, pair, high }

enum CardValue { n2, n3, n4, n5, n6, n7, n8, n9, T, J, Q, K, A }

extension on String {
  CardValue get value {
    if (int.tryParse(this) != null) {
      return CardValue.values
          .firstWhere((cardValue) => cardValue.index + 2 == int.parse(this));
    } else {
      switch (this) {
        case 'A':
          return CardValue.A;
        case 'K':
          return CardValue.K;
        case 'Q':
          return CardValue.Q;
        case 'J':
          return CardValue.J;
        case 'T':
          return CardValue.T;
        default:
      }
    }
    print("FEHLER !!! $this");
    return CardValue.n2;
  }
}
