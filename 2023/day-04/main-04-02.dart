import 'dart:convert';
import 'dart:io';

import 'game.dart';

void main(List<String> args) {
  final inputFile = File("./day-04/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);

  final games = inputList.map((e) => Game.fromString(e)).toList();

  for (var i = 0; i < games.length; i++) {
    final game = games[i];
    for (var j = 0; j < game.winCount; j++) {
      games[i + j + 1].instanceCount += game.instanceCount;
    }
  }
  var cardSum = 0;

  games.forEach((game) => cardSum += game.instanceCount);

  print(cardSum);
}
