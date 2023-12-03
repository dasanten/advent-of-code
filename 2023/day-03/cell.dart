class Cell {
  const Cell(this.value);

  final value;

  bool get isNumber => int.tryParse(value) != null;

  bool get isPeriod => value == '.';

  bool get isSymbol => !isNumber && !isPeriod;

  bool get isMultiplying => value == '*';
}
