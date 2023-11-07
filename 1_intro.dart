import 'dart:io';

void main() {
  print("Hello World");

  var name = "Novar";
  print(name);

  var year = 1997;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print(image);

  // 流程控制语句
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
  print(year);

  // 函数
  int fibonacci(int n) {
    if (n == 0 || n == 1) {
      return n;
    }

    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);

  print(result);

  flybyObjects
      .where((element) => element.contains('turn'))
      .forEach((element) => print(element));

  // 类
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager2 = Spacecraft.unlaunched('Voyager II');
  voyager2.describe();

  // Enum
  print(PlanetType.gas);

  final yourPlanet = Planet.mercury;
  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }

  // 扩展类（继承）
  var orbiter = Orbiter('Orbiter', DateTime(2021, 1, 1), 100);
  orbiter.describe();

  // mixin
  var piloted = PilotedCraft('Piloted', DateTime(2021, 1, 1));
  piloted.describeCrew();

  // 所有的类都隐式定义成了一个接口。因此，任意类都可以作为接口被实现。
  // 类就是接口，没有interface一说

  // 异步
  const oneSecond = Duration(seconds: 1);
  // 。。。
  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start describing $object in this file.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }
}

enum PlanetType { terrestrial, gas, ice }

enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  const Planet(
      {required this.planetType, required this.moons, required this.hasRings});

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

class Spacecraft {
  String name = "";
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(String name, this.launchDate) {
    this.name = name + "-" + name;
  }

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft\'s name :$name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $years years ago');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
}

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name = "";

  @override
  int? get launchYear => null;

  @override
  void describe() {}
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
