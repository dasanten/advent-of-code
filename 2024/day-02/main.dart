import 'dart:convert';
import 'dart:io';

import '../utils.dart';

void main(List<String> args) {
  final inputFile = File("./day-02/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);

  final reports = <List<int>>[];

  inputList.forEach((row) {
    final numbers = row.split(' ');
    reports.add(numbers.map((e) => int.parse(e),).toList());
  },);

  print(reports.amount((element) => isSave(element),));
}

bool isSave(List<int> report) {
  bool increasing = report.first < report[1];
  int? lastLevel;
  for (var i = 0; i < report.length; i++) {
    final level = report[i];
    if (increasing && (lastLevel ?? level) > level) {
       return false;
    } 
    if (!increasing && (lastLevel ?? level) < level) {
       return false;
    } 
    if (lastLevel != null) {
      final difference = IntUtil.distance(lastLevel, level);
      if ( difference < 1 || difference > 3) {
        return false;
      }
    }
    
    lastLevel = level;
  }


  return true;
}

