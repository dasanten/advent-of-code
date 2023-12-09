import 'dart:convert';
import 'dart:io';

import '../utils.dart';
import 'node.dart';

void main(List<String> args) {
  final inputFile = File("./day-08/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input).toList();
  final mapNodes = inputList.sublist(2);

  final instructions = inputList.first
      .split('')
      .map((e) => e == "R" ? Instruction.Right : Instruction.Left)
      .toList();

  final map = <String, Node>{};
  mapNodes.forEach((e) {
    final splittedString = e.split(' = ');
    final key = splittedString.first;
    final node = splittedString.last;
    map[key] = Node.fromString(node);
  });
  var insturctIndex = 0;
  var steps = 0;
  var currentNodes =
      map.keys.where((element) => element.split('').last == "A").toList();
  while (true) {
    if (insturctIndex == instructions.length) {
      insturctIndex = 0;
    }
    steps++;
    for (var i = 0; i < currentNodes.length; i++) {
      final currentNode = currentNodes[i];
      final node = map[currentNode]!;
      currentNodes[i] = instructions[insturctIndex] == Instruction.Left
          ? node.left
          : node.right;
    }
    insturctIndex++;
    final zNodes =
        currentNodes.amount((element) => element.split('').last == "Z");
    if (zNodes > 2) print(zNodes);
    if (currentNodes.every((e) => e.split('').last == "Z")) break;
  }
  print(steps);
}

enum Instruction { Right, Left }
