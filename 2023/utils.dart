import 'dart:math' as math;

extension IntListX on List<int> {
  int get sum => this.reduce((a, b) => a + b);
  int get max => this.reduce(math.max);
}
