// base
// 要强制继承类或 mixin 的实现，请使用 base 修饰符。
// base 类不允许在其自己的库之外实现
// 1. 每当创建该类的子类型的实例时，都会调用 base 类构造函数;
// 2. 所有实现的私有成员都存在于子类型中
// 您必须将实现或扩展基类的任何类标记为 base 、 final 或 sealed;
// 这可以防止外部库破坏基类保证。

// Library a.dart
base class Vehicle {
  void moveForward(int meters) {
    print('Vehicle moved forward by $meters meters.');
  }
}

// sealed
// 要防止其他库扩展类，请使用 sealed 修饰符。
// sealed 类不允许在其自己的库之外扩展
// 1. 您可以在同一库中扩展 sealed 类;
// 3. 您可以在同一库中创建 sealed 类的实例;
// 4. 您可以将 sealed 类用作参数类型或返回类型;
// 5. 您可以使用 as 或 is 运算符将实例转换为 sealed 类型;
// 6. 您可以使用 sealed 类的构造函数。

sealed class VehicleSealed {
  void moveForward(int meters) {
    print('VehicleSealed moved forward by $meters meters.');
  }
}

class Car extends VehicleSealed {
  int passengers = 4;

  @override
  void moveForward(int meters) {
    super.moveForward(meters);
  }
}
