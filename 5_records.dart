void main() {
  // Records
  // Dart 2.3 引入了一种新的数据类型：records
  // records 是一种轻量级的数据类型，用于存储具有命名字段的对象
  // records 是不可变的，这意味着一旦创建了记录，就不能更改其字段值
  // records 与类相似，但是它们没有方法
  // records 与 maps 相似，但是它们具有类型信息，并且可以在编译时进行验证
  var record = ('first', a: 2, b: true, 'last');
  print('record = $record'); // record = (first, a: 2, b: true, last)
  // print('record.first = ${record.first}'); // error,命名字段
  // print('first = $first');
  print('record.a = ${record.a}'); // record.a = 2
  print('record.b = ${record.b}'); // record.b = true

  // record 类型注释是括在括号中的以逗号分隔的类型列表。
  //您可以使用记录类型注释来定义返回类型和参数类型。例如，以下 (int, int) 语句是记录类型注释：
  // (int, int) => int
  // (int, {int? b}) => int
  // (int, [int]) => int
  // (int, int, [int]) => int

  (int, int) swap((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  // record 表达式和类型注释中的字段反映了参数和参数在函数中的工作方式。
  // 位置字段直接位于括号内：
  (String, int) record1 = ('first', 2);
  // 命名字段在括号之后，用冒号分隔：
  (String, {int? a, bool? b}) record2 = ('first', a: 2, b: true);
  // 位置字段和命名字段可以混合使用：
  (String, int, {int? a, bool? b}) record3 = ('first', 2, a: 2, b: true);

  // 记录类型中命名字段的名称是记录类型定义或其形状的一部分。具有不同名称的命名字段的两条记录具有不同的类型：
  ({int a, int b}) recordAB = (a: 1, b: 2);
  ({int x, int y}) recordXY = (x: 3, y: 4);
  // Compile error! These records don't have the same type.
  // recordAB = recordXY;

  // 在记录类型注释中，您还可以命名位置字段，但这些名称纯粹用于文档，不会影响记录的类型：
  (int a, int b) recordAB2 = (1, 2);
  (int x, int y) recordXY2 = (3, 4);
  recordAB2 = recordXY2; // OK.

  var recordGet = ('first', a: 2, b: true, 'last');
  print(recordGet.$1); // Prints 'first'
  print(recordGet.a); // Prints 2
  print(recordGet.b); // Prints true
  print(recordGet.$2); // Prints 'last'

  (num, Object, {int b}) pair = (42, 'a', b: 5);

  var first = pair.$1; // Static type `num`, runtime type `int`.
  var second = pair.$2; // Static type `Object`, runtime type `String`.
  var b = pair.b; // Static type `int?`, runtime type `int?`.

  // Record equality
  // 两个记录相等，当且仅当它们具有相同的类型和相等的字段值
  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);

  print(point == color); // Prints 'true'.

  // Multiple returns
  (String, int) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['age'] as int);
  }

  final json = <String, dynamic>{
    'name': 'Dash',
    'age': 10,
    'color': 'blue',
  };

  var (name, age) = userInfo(json);

  /* Equivalent to:
  var info = userInfo(json);
  var name = info.$1;
  var age  = info.$2;
*/
}
