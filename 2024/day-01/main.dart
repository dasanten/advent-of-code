import 'dart:convert';
import 'dart:io';

import '../utils.dart';

void main(List<String> args) {
  final inputFile = File("./day-01/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);
  final leftList = [];
  final rightList = [];
  
  inputList.forEach((row) {
    final numbers = row.split('   ');
    leftList.add(int.parse(numbers.first));
    rightList.add(int.parse(numbers.last));
  },);

  leftList.sort();
  rightList.sort();
  print(leftList);
  print(rightList);

  final distances = <int>[];

  for (var i = 0; i < leftList.length; i++) {
    final leftValue = leftList[i];
    final rightValue = rightList[i];

    if (leftValue > rightValue) {
      distances.add(leftValue-rightValue);
    } else {
      distances.add(rightValue-leftValue);
    }

  }
    print(distances.sum);


}
