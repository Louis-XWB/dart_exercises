import 'dart:math';

late String description;

late int lazyValue = testLazy();

void main() {
  var name = 'Bob';
  String nameStr = 'Bob';
  Object nameObj = 'Bob';

// 空安全
  String? nameOrNull;
  String nameNotNull;
  print('nameOrNull: $nameOrNull');
  // print('nameNotNull: $nameNotNull');

  //int
  int lineCount;
  if (nameObj is String) {
    lineCount = nameObj.length;
  } else {
    lineCount = 0;
  }
  print(lineCount);

  description = 'Hello';
  print('description = $description');

  //lazy
  print('lazyValue = $lazyValue');
  print('lazyValue = $lazyValue');

  //final
  final nameFinal = 'Bob'; //省略var和类型
  // nameFinal = 'Alice'; // Error: a final variable can only be set once.
  final String nameFinalStr;
  nameFinalStr = 'Bob';

  //const 编译时就是常量，初始化好
  const bar = 1000000;
  const double atm = 1.01325 * bar;
  var foo = const [];
  foo = [1, 2, 3]; // Was const []
  foo = [2, 2, 3]; // Now it’s a const.
  //赋值时不会报错的，只是指向新的地址
  // foo[0] = 1; // Error: Cannot modify an unmodifiable list

  var a = const [];
  var b = const [];
  print(identical(a, b)); // true，因为它们指向相同的常量列表实例

  var c = [];
  var d = [];
  print(identical(c, d)); // false，因为每个都是一个不同的列表实例

  final barFinal = const [];
  const baz = []; // Equivalent to `const []`

  //类型转换
  const Object i = 3;
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: "int"}; // Use is and collection if.
  //如果i不是int，map = {}

  const set = {if (list is List<int>) ...list}; // ...and a spread.
}

int testLazy() {
  return Random().nextInt(100);
}
