void main() {
  print('5 ~/ 2 = ${5 ~/ 2}'); // 2

  int a = 0;
  Object b = 3;
  // as
  // 当且仅当您确定对象属于该类型时，才可以使用 as 运算符将对象强制转换为特定类型
  // (a as String).toString();// 报错
  print('b as int = ${b as int}'); // 3

  // is
  // is 运算符用于检查对象是否具有特定类型
  print('a is int = ${a is int}'); // true

  // is!
  // is! 运算符用于检查对象是否不具有特定类型
  print('a is! int = ${a is! int}'); // false

  // Assign value to a
  String str1 = 'str1';
  String? str2;
// 如果 b 为 null，则为 b 赋值；否则，b 保持不变
  str2 ??= str1;
  print('str2 = $str2'); // str2 = ''

  // ??
  // expr1 ?? expr2
  // 如果 expr1 为 non-null，则返回其值；否则，计算并返回 expr2 的值
  // == if (expr1 != null) expr1 else expr2
  // == expr1 != null ? expr1 : expr2

  // 级联表示法
  // .. 运算符可以在同一个对象上多次调用多个对象的成员
  // 通过级联运算符，您可以短时间内对单个对象进行多次操作，而无需将该对象存储到临时变量中
  var paint = Paint()
    ..color = 'blue'
    ..strokeCap = 3
    ..strokeJoin = 3;

  // 在返回实际对象的函数上构建级联时要小心。例如，以下代码会失败：
  // paint..setColor('blue')..setStrokeCap(3)..setStrokeJoin(3);
  // 因为 setColor() 方法返回 void，而不是 Paint 对象
}

class Paint {
  String color = 'red';
  String get getColor => color;

  set setColor(String color) => this.color = color;

  int strokeCap = 1;
  int strokeJoin = 1;
  // Paint(this.color, this.strokeCap, this.strokeJoin);
}
