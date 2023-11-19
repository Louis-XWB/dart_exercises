import '18_enum.dart';
import '21_base_library.dart';

void main() {
  var v = Vehicle();
  v.moveForward(10);

  var c = Car();
  c.moveForward(20);
}

// base
// 要强制继承类或 mixin 的实现，请使用 base 修饰符。
// base 类不允许在其自己的库之外实现
// 1. 每当创建该类的子类型的实例时，都会调用 base 类构造函数;
// 2. 所有实现的私有成员都存在于子类型中
// 您必须将实现或扩展基类的任何类标记为 base 、 final 或 sealed;
// 这可以防止外部库破坏基类保证。

// Library a.dart
base class Car extends Vehicle {
  int passengers = 4;

  @override
  void moveForward(int meters) {
    // TODO: implement moveForward
    super.moveForward(meters);
    print('Car moved forward by $meters meters.');
  }
}

// ERROR: Cannot be implemented
// base class MockVehicle implements Vehicle {
//   @override
//   void moveForward() {
//     // ...
//   }
// }

// ERROR: Sealed class can't be extended, implemented, or mixed in outside of its library 
// because it's a sealed class
// class MockVehicle implements VehicleSealed {
//   @override
//   void moveForward() {
//     // ...
//   }
// }
