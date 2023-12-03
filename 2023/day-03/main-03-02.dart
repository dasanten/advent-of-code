import 'dart:convert';
import 'dart:io';

import 'cell.dart';

void main(List<String> args) {
  final inputFile = File("./day-03/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);

  final grid = <List<Cell>>[];

  inputList.forEach((element) {
    final row = <Cell>[];
    element.split('').forEach((element) {
      row.add(Cell(element));
    });
    grid.add(row);
  });

  var sum = 0;

  for (var y = 0; y < grid.length; y++) {
    final row = grid[y];
    String? currentNumber;
    for (var x = 0; x < row.length; x++) {
      final cell = row[x];
      if (cell.isNumber) {
        if (currentNumber == null) currentNumber = "";
        currentNumber += "" + cell.value;
      }
      if ((row.length <= x + 1 || !row[x + 1].isNumber) &&
          currentNumber != null) {
        if (hasNeighborSymbol(grid, x: x, y: y, currentNumber: currentNumber)) {
          sum += int.parse(currentNumber);
        }
        currentNumber = null;
      }
    }
  }

  print(sum);
}

bool hasNeighborSymbol(List<List<Cell>> grid,
    {required int x, required int y, required String currentNumber}) {
  final startIndex = x - currentNumber.length > 0
      ? x - currentNumber.length
      : x - currentNumber.length + 1;
  final endIndex = x + 1 < grid.first.length ? x + 1 : x;
  final startColumn = y > 0 ? y - 1 : y;
  final endColumn = y + 1 < grid.length ? y + 1 : y;
  for (var j = startColumn; j <= endColumn; j++) {
    for (var i = startIndex; i <= endIndex; i++) {
      final cell = grid[j][i];
      if (cell.isSymbol) {
        return true;
      }
    }
  }

  return false;
}
