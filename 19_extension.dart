// handle conflict
// import 'string_apis_2.dart' hide NumberParsing2;
// 1. hide
// 2. applying the extension explicitly,
void main() {
  var number = '123';
  print(number.parseInt());
  print(NumberParsing(number).parseInt());

  var number2 = '23 2';
  print('number2 is blank: ${number2.isBlank}');
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension on String {
  bool get isBlank => trim().isEmpty;
}

// Implementing generic extensions
extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
