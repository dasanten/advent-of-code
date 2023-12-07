import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  final inputFile = File("./day-06/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input).toList();

  final timeAsString = RegExp(r'[0-9]+')
      .allMatches(inputList.first)
      .map((e) => e.group(0)!)
      .reduce((a, b) => a + b);
  final time = int.parse(timeAsString);

  final distanceAsString = RegExp(r'[0-9]+')
      .allMatches(inputList[1])
      .map((e) => e.group(0)!)
      .reduce((a, b) => a + b);
  final distance = int.parse(distanceAsString);

  int soultionCount = 0;
  for (var pressTime = 0; pressTime < time; pressTime++) {
    final speed = pressTime;
    final tryDistance = (time - speed) * speed;
    if (tryDistance > distance) {
      soultionCount++;
    }
  }

  print(soultionCount);
}
