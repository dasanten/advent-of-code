import 'dart:convert';
import 'dart:io';

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
  var currentNode = "AAA";
  while (true) {
    if (insturctIndex == instructions.length) {
      insturctIndex = 0;
    }
    steps++;

    final node = map[currentNode]!;
    currentNode = instructions[insturctIndex] == Instruction.Left
        ? node.left
        : node.right;
    insturctIndex++;

    if (currentNode == "ZZZ") break;
  }
  print(steps);
}

enum Instruction { Right, Left }
