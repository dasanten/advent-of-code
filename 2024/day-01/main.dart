import 'dart:convert';
import 'dart:io';

import '../utils.dart';

void main(List<String> args) {
  final inputFile = File("./day-01/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);
  final leftList = <int>[];
  final rightList = <int>[];
  
  inputList.forEach((row) {
    final numbers = row.split('   ');
    leftList.add(int.parse(numbers.first));
    rightList.add(int.parse(numbers.last));
  },);

  final similarityScores = <int>[];

  leftList.forEach((element) {
    final instances = rightList.amount((rightListValue) => rightListValue == element,);
    similarityScores.add(instances * element);
  },); 

  print(similarityScores.sum);

}

void part1(List<int> leftList, List<int> rightList) {
  
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