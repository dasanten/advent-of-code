class Game {
  Game(this.winningNumbers, this.numbers);
  final List<int> numbers;
  final List<int> winningNumbers;
  int instanceCount = 1;

  factory Game.fromString(String string) {
    final cardStrings = string.split(': ');
    final numberStrings = cardStrings[1].split('| ');
    final winningNumbers = _numberStringToNumberList(numberStrings[0]);
    final numbers = _numberStringToNumberList(numberStrings[1]);

    return Game(winningNumbers, numbers);
  }

  int get points {
    var points = 0;
    numbers.forEach((number) {
      if (winningNumbers.any((element) => element == number)) {
        if (points == 0) {
          points = 1;
        } else {
          points *= 2;
        }
      }
    });

    return points;
  }

  int get winCount {
    var wins = 0;
    numbers.forEach((number) {
      if (winningNumbers.any((element) => element == number)) {
        wins += 1;
      }
    });

    return wins;
  }
}

List<int> _numberStringToNumberList(String numbers) {
  final splittedNumbers = numbers.split(' ');
  final list = <int>[];

  splittedNumbers.forEach((number) {
    if (number.isNotEmpty) list.add(int.parse(number));
  });
  return list;
}
