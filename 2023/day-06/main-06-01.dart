import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  final inputFile = File("./day-06/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input).toList();

  final times = RegExp(r'[0-9]+')
      .allMatches(inputList.first)
      .map((e) => int.parse(e.group(0)!))
      .toList();
  final distances = RegExp(r'[0-9]+')
      .allMatches(inputList[1])
      .map((e) => int.parse(e.group(0)!))
      .toList();

  final solutions = <int>[];
  for (var i = 0; i < times.length; i++) {
    final time = times[i];
    int soultionCount = 0;
    for (var pressTime = 0; pressTime < time; pressTime++) {
      final speed = pressTime;
      final distance = (time - speed) * speed;
      if (distance > distances[i]) {
        soultionCount++;
      }
    }
    solutions.add(soultionCount);
    print("____");
  }

  print(solutions.reduce((a, b) => a * b));
}
