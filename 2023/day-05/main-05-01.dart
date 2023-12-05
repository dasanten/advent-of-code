import 'dart:convert';
import 'dart:io';

import 'mapper.dart';

void main(List<String> args) {
  final inputFile = File("./day-05/input.txt");
  final input = inputFile.readAsStringSync();
  final inputList = LineSplitter.split(input);

  final seeds = inputList
      .toList()[0]
      .replaceAll('seeds: ', '')
      .split(' ')
      .map((e) => int.parse(e))
      .toList();

  Mapper seedToSoil = Mapper();
  Mapper soilToFertilizer = Mapper();
  Mapper fertilizerToWater = Mapper();
  Mapper waterToLight = Mapper();
  Mapper lightToTemperature = Mapper();
  Mapper temperatureToHumidity = Mapper();
  Mapper humidityToLocation = Mapper();

  var emptyLineCount = 0;

  for (final line in inputList) {
    if (line.isEmpty) {
      emptyLineCount++;
      continue;
    }
    if (int.tryParse(line.split('').first) == null) continue;
    switch (emptyLineCount) {
      case 0:
        break;
      case 1:
        seedToSoil.addEntry(line);
        break;
      case 2:
        soilToFertilizer.addEntry(line);
        break;
      case 3:
        fertilizerToWater.addEntry(line);
        break;
      case 4:
        waterToLight.addEntry(line);
        break;
      case 5:
        lightToTemperature.addEntry(line);
        break;
      case 6:
        temperatureToHumidity.addEntry(line);
        break;
      case 7:
        humidityToLocation.addEntry(line);
        break;
      default:
    }
  }
  final mappers = [
    seedToSoil,
    soilToFertilizer,
    fertilizerToWater,
    waterToLight,
    lightToTemperature,
    temperatureToHumidity,
    humidityToLocation
  ];

  final seedToLocationMap = <Map<String, int>>[];

  seeds.forEach((seed) {
    var currentId = seed;
    mappers.forEach((mapper) {
      currentId = mapper.getId(currentId);
      if (mapper == mappers.last) {
        seedToLocationMap.add({
          'seed': seed,
          'location': currentId,
        });
      }
    });
  });

  final lowestLocation = seedToLocationMap.reduce((a, b) {
    final aLocation = a['location']!;
    final bLocation = b['location']!;
    return aLocation < bLocation ? a : b;
  });

  print(lowestLocation['location']);
}
