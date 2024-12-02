import 'dart:math' as math;

extension IntListX on List<int> {
  int get sum => this.reduce((a, b) => a + b);
  int get max => this.reduce(math.max);
}

extension IterableX<E> on Iterable<E> {
  int amount(bool test(E element)) {
    return this.where(test).length;
  }
}
