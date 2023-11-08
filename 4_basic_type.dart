void main() {
  // Numbers
  // int 64 位（8 字节）整数值
  int a = 1;
  var b = 2;
  // double 64 位（8 字节）双精度浮点数
  double c = 1.1;
  var d = 2.2;
  // num 64 位（8 字节）数字（整数或浮点数）
  num e = 1;
  var f = 2.2;

  // Numbers parse
  // int.parse() 将字符串解析为 int
  var one = int.parse('1');
  // double.parse() 将字符串解析为 double
  var onePointOne = double.parse('1.1');

  String oneAsString = 1.toString();
  String piAsString = 3.14159.toStringAsFixed(2); // 保留两位小数

  // Strings
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  //  ${ expression } 将表达式的值放入字符串中
  var s = 'string interpolation ${1 + 1}'; // string interpolation
  // 如果表达式是标识符，则可以跳过 {}
  var s5 = 'string interpolation $s';

  // 创建多行字符串的另一种方法：使用带有单引号或双引号的三引号：
  var s6 = '''
You can create
multi-line strings like this one.
''';
  print('s6 = $s6');

  var s7 = """This is also a
multi-line string.""";
  print('s7 = $s7');

  // r 前缀, raw string
  var s8 = r'In a raw string, not even \n gets special treatment.';
  print('s8 = $s8');

  // Booleans
  // bool 布尔值，只有两个对象：true 和 false
  bool t = true;
  var f1 = false;
}
