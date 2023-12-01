import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  final inputFile = File("./day-01/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);

  final resultList = <int>[];
  inputList.forEach((line) {
    line = replaceStringNumbers(line);
    final chars = line.split('').toList();
    final numbers = chars.where((element) => int.tryParse(element) != null);
    if (numbers.isNotEmpty) {
      resultList.add(int.parse(numbers.first + numbers.last));
    }
  });

  var result = 0;
  resultList.forEach((r) => result += r);

  print(result);
}

final numbers = {
  'one': 1,
  'two': 2,
  'three': 3,
  'four': 4,
  'five': 5,
  'six': 6,
  'seven': 7,
  'eight': 8,
  'nine': 9
};

String replaceStringNumbers(String encodedString) {
  String resultString = encodedString;

  for (var entry in numbers.entries) {
    resultString = resultString.replaceAll(
        entry.key, entry.key + entry.value.toString() + entry.key);
  }
  return resultString;
}
