import 'dart:math';

class Game {
  const Game(this.id, this.red, this.green, this.blue);

  final int id;
  final List<int> red;
  final List<int> green;
  final List<int> blue;

  factory Game.fromString(String string) {
    final splittedString = string.split(": ");
    final gameString = splittedString[0];
    final id = gameString.replaceAll("Game ", "");
    final cubesString = splittedString[1];
    final takes = cubesString.split('; ');

    final red = <int>[];
    final green = <int>[];
    final blue = <int>[];

    takes.forEach((take) {
      final cubes = take.split(', ');

      cubes.forEach((cube) {
        if (cube.endsWith("red")) red.add(cube.value);
        if (cube.endsWith("green")) green.add(cube.value);
        if (cube.endsWith("blue")) blue.add(cube.value);
      });
    });

    return Game(int.parse(id), red, green, blue);
  }

  bool isPossible({required int red, required int green, required int blue}) {
    final rEnough = this.red.reduce(max) <= red;
    final gEnough = this.green.reduce(max) <= green;
    final bEnough = this.blue.reduce(max) <= blue;
    return rEnough && gEnough && bEnough;
  }

  int get powerOfNeededCubes {
    final redNeeded = this.red.reduce(max);
    final greenNeeded = this.green.reduce(max);
    final blueNeeded = this.blue.reduce(max);
    return redNeeded * greenNeeded * blueNeeded;
  }
}

extension _CubeValue on String {
  int get value {
    final number = this.split(' ');
    return int.parse(number[0]);
  }
}
