class Mapper {
  final entries = <MapperEntry>[];

  void addEntry(String string) {
    final values = string.split(' ').map((e) => int.parse(e)).toList();
    entries.add(MapperEntry(values[0], values[1], values[2]));
  }

  int getId(int id) {
    int? foundId;
    entries.forEach((entry) {
      if (entry.inRange(id)) {
        foundId = entry.destinationId(id);
      }
    });

    return foundId ?? id;
  }
}

class MapperEntry {
  final int destinationStart;
  final int sourceStart;
  final int range;

  MapperEntry(this.destinationStart, this.sourceStart, this.range);

  int get maxSource => sourceStart + range - 1;

  bool inRange(int id) => id >= sourceStart && id <= maxSource;

  int destinationId(int id) {
    return id - sourceStart + destinationStart;
  }
}
