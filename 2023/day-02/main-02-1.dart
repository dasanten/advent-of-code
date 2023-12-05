import 'dart:convert';
import 'dart:io';

import 'game.dart';

void main(List<String> args) {
  final inputFile = File("./day-02/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);

  final games = inputList.map((e) => Game.fromString(e)).toList();

  var idSum = 0;

  games.forEach((game) {
    if (game.isPossible(red: 12, green: 13, blue: 14)) {
      idSum += game.id;
    }
  });

  print(idSum);
}
