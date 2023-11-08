import 'dart:math' as math;

void main() {
  // Patterns
  // Dart 语言中的模式是一种特殊的语法，用于匹配和提取数据结构中的数据。

  var number = 1;
  switch (number) {
    // Constant pattern matches if 1 == number.
    case 1:
      print('one');
  }

  var list = [1, 2, 3];
  const a = 1;
  const b = 2;
  const c = 3;
  switch (list) {
    // List pattern [a, b] matches obj first if obj is a list with two fields,
    // then if its fields match the constant subpatterns 'a' and 'b'.
    case [a, b, c]:
      print('$a, $b and $c');
  }

  var [a1, b1, c1] = list;
  print('$a1, $b1 and $c1');

  switch (list) {
    case [1 || 5, var b, var c]:
      print(c);
  }

  var (a2, [b2, c2]) = ('str', [1, 2]);
  print('$a2, $b2 and $c2');

  var (a3, b3) = ('left', 'right');
  (b3, a3) = (a3, b3); // Swap.
  print('$a3 $b3'); // Prints "right left".

  const first = 1;
  const last = 10;
  switch (number) {
    // Matches if 1 == obj.
    case 1:
      print('one');

    // Matches if the value of obj is between the constant values of 'first' and 'last'.
    case >= first && <= last:
      print('in range');

    // Matches if obj is a record with two fields, then assigns the fields to 'a' and 'b'.
    case (var a, var b):
      print('a = $a, b = $b');

    default:
  }

  var color = Color.red;
  var isPrimary = switch (color) {
    Color.red || Color.yellow || Color.blue => true,
    _ => false
  };

  Map<String, int> hist = {
    'a': 23,
    'b': 100,
  };

  for (var MapEntry(key: key, value: count) in hist.entries) {
    print('$key occurred $count times');
  }

  for (var entry in hist.entries) {
    var key = entry.key;
    var count = entry.value;
    print('$key occurred $count times');
  }

  final Foo myFoo = Foo('one', 2);
  var Foo(:one, :two) = myFoo;
  print('one $one, two $two');

  var cicle = Circle(2);
  //cicle.radius = 3;
  print(calculateArea(cicle));

  var json = {
    'user': ['Lily', 13]
  };
  var {'user': [name, age]} = json;

  if (json case {'user': [String name, int age]}) {
    print('User $name is $age years old.');
  }
}

enum Color { red, yellow, blue }

class Foo {
  String one;
  int two;

  Foo(this.one, this.two);
}

// sealed： 限制继承
sealed class Shape {}

class Square implements Shape {
  final double length;
  Square(this.length);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
      Square(length: var l) => l * l,
      Circle(radius: var r) => math.pi * r * r
    };
