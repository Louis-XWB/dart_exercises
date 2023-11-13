import 'dart:math';

void main() {
  var point = Point(2, 5);
  point.printPoint();
  point += Point(3, 4);
  point.printPoint();

  var point2 = null;
  //var point2 = null; 声明了一个变量 point2 并将其初始化为null。
  //这种情况下，point2 被推断为 dynamic 类型，因为它的类型没有被明确指定。
  // 然后，var a = point2.y; 试图访问 point2 的属性 y，
  // 但由于 point2 被推断为 dynamic 类型，编译器不会提供属性检查，因此不会在编译时报错。
  // var a = point2.y;
  //-------
  // var a = point2?.y; // 使用安全调用操作符 "?" 来避免在 point2 为 null 时引发异常
  var a = point2?.y;
  print('a: $a');

  // constructor
  var p1 = Point(2, 2);
  var p2 = Point.fromJson({'x': 1, 'y': 2});

  // const
  var p3 = const ImmutablePoint(1, 1);
  // 当你使用 const 关键字创建对象时，它实际上是告诉Dart在编译时计算这个表达式，而不是在运行时计算
  // 当你使用 const 关键字创建对象时，Dart会尽量重用已有的对象，而不是每次都创建新的实例
  // 每次使用相同参数的 const ImmutablePoint(1, 1) 都会返回相同的对象，而不是每次都创建一个新对象。

  var p4 = ImmutablePoint(1, 1);
  // 如果你写 var p = ImmutablePoint(2, 2);，Dart 将在运行时创建一个新的 ImmutablePoint 对象

  var i1 = const ImmutablePoint(1, 1);
  var i2 = const ImmutablePoint(1, 1);
  print('a and b is Same? ${identical(i1, i2)}'); // true

  print('The type of i2 is ${i2.runtimeType}');

  //所有实例变量都会生成隐式 getter 方法
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));

  // static var
  print(Queue.initialCapacity);

  // static method
  var distance = Point.distanceBetween(Point(1, 1), Point(2, 2));
  print('distance: $distance');
}

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';

  Point.fromJson(Map<String, dynamic> json)
      : x = json['x'],
        y = json['y'];

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

extension PointExtension on Point {
  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  void printPoint() {
    print('this is Point($x, $y)');
  }
}

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);

  // double get x {
  //   return x;
  // }

  set x(double x) {
    print('set x: $x');
    x = x;
  }
}

class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}

class Person {
  final String _name;

  Person(this._name);

  String greet(String who) => 'Hello, $who. I am $_name';
}

class Impostor implements Person {
  String get _name => '';

  @override
  String greet(String who) {
    return 'Hi $who. Do you know who I am?';
  }
}

String greetBob(Person person) => person.greet('Bob');

// static const
class Queue {
  static const initialCapacity = 16;
  // ···
}
