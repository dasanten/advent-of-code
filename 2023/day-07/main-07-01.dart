import 'dart:convert';
import 'dart:io';

import 'card_set.dart';

void main(List<String> args) {
  final inputFile = File("./day-07/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input).toList();

  final sets = inputList.map(CardSet.fromString).toList();

  sets.sort(compareWithCardSet);

  var sum = 0;

  for (var i = 0; i < sets.length; i++) {
    final set = sets.reversed.toList()[i];
    sum += set.bid * (i + 1);
  }

  print(sum);
}

int compareWithCardSet(CardSet a, CardSet b) {
  if (a.value != b.value) return a.value.index - b.value.index;
  for (var i = 0; i < 5; i++) {
    final aCardValue = a.cards[i];
    final bCardValue = b.cards[i];
    if (aCardValue == bCardValue) continue;
    return bCardValue.index - aCardValue.index;
  }
  return 1;
}
