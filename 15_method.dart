void main() {
  final v1 = Vector(1, 2);
  final v2 = Vector(3, 4);
  final v3 = Vector(1, 2);
  print('v1 == v2: ${v1 == v2}');
  print('v1 == v3: ${v1 == v3}');

  var rect = Rectangle(3, 4, 20, 15);
  print('rect.left: ${rect.left}');
  rect.right = 12;
  print('rect.left: ${rect.left}');
}

class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);

  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  @override
  bool operator ==(Object v) => v is Vector && v.x == x && v.y == y;

  @override
  int get hashCode => Object.hash(x, y);
}

class Rectangle {
  double left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  double get right => left + width;
  set right(double value) => left = value - width;

  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {
    // TODO: implement doSomething
  }
}
