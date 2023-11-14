void main() {
  var vector2d = Vector2d(1, 2);
  vector2d.printVector();
  var vector2d_2 = Vector2d.named(x: 3, y: 4);
  vector2d_2.printVector();

  var vector3d = Vector3d(1, 2, 3);
  vector3d.printVector();
  var vector3d_2 = Vector3d.yzPlane(y: 2, z: 3);
  vector3d_2.printVector();

  // factory
  var logger = Logger('UI');
  logger.log('Button clicked');

  var logger2 = Logger.fromJson({'name': 'Market'});
  logger2.log('Market opened');

  var logger3 = Logger.fromJson({'name': 'Market'});
  print('logger2 == logger3: ${logger2 == logger3}');
}

class Point {
  double x = 0;
  double y = 0;

  // 构造函数不会被继承
  Point(double x, double y) {
    // See initializing formal parameters for a better way
    // to initialize instance variables.
    this.x = x;
    this.y = y;
  }

  // Point(this.x, this.y);

  Point.origin()
      : x = xOrigin,
        y = yOrigin;

  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }

  Point.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }

  // Redirecting constructors
  Point.alongXAxis(double x) : this(x, 0);
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  // Constant constructors
  const ImmutablePoint(this.x, this.y);
}

const double xOrigin = 0;
const double yOrigin = 0;

class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

// 如果超类没有未命名、无参数的构造函数，
// 则必须手动调用超类中的构造函数之一。在冒号 ( : ) 之后、构造函数主体（如果有）之前指定超类构造函数。
class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson().
  Employee.fromJson(super.data) : super.fromJson() {
    print('in Employee');
  }

  Employee() : super.fromJson({});
}

// Super parameters 超参数
class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);

  Vector2d.named({required this.x, required this.y});

  printVector() {
    print('Vector($x, $y)');
  }
}

class Vector3d extends Vector2d {
  final double z;

  Vector3d(super.x, super.y, this.z);

  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);

  @override
  printVector() {
    print('Vector($x, $y, $z)');
  }
}

//Factory constructors
class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  void log(String msg) {
    if (!mute) print(msg);
  }
}
