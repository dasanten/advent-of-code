import 'dart:math' as math;

class IntUtil {
  static int distance(int a, int b) {
    if (a > b) {
       return a - b;
    } else {
      return b - a;
    }
 }
  
}

extension IntListX on List<int> {
  int get sum => this.reduce((a, b) => a + b);
  int get max => this.reduce(math.max);
}

extension IterableX<E> on Iterable<E> {
  int amount(bool test(E element)) {
    return this.where(test).length;
  }
}
