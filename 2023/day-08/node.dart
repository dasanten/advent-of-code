class Node {
  Node(this.left, this.right);
  final String left;
  final String right;

  factory Node.fromString(String string) {
    string = string.replaceAll('(', '').replaceAll(')', '');
    final splittedString = string.split(', ');
    return Node(splittedString.first, splittedString.last);
  }
}
