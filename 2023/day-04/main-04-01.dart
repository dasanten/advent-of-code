import 'dart:convert';
import 'dart:io';

import 'game.dart';

void main(List<String> args) {
  final inputFile = File("./day-04/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);

  final games = inputList.map((e) => Game.fromString(e)).toList();

  var sum = 0;

  games.forEach((game) => sum += game.points);

  print(sum);
}
