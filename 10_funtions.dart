bool topLevel = true;

void main(List<String> arguments) {
  // 函数也是对象
  print('isNoble: ${isNoble(1)}');

  print('isNoble2: ${isNoble2(1)}');

  print('isNobleIgnoreType: ${isNobleIgnoreType(1)}');

  // Named parameters
  enableFlags(bold: true, hidden: false);

  // Default parameter values
  enableFlags2(bold: true);

  // required parameters
  enableFlags3(hidden: true);

  // optional parameters
  print(say('Bob', 'Howdy'));

  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');

  assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');

  // main
  print(arguments);
  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');

  // Functions as first-class objects
  var list = [1, 2, 3];
  list.forEach(printElement);

  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');

  const fruitList = ['apples', 'bananas', 'oranges'];
  fruitList.map((e) => e.toUpperCase()).forEach((element) {
    print(element);
  });
  fruitList.map((e) => e.toUpperCase()).forEach(printElementObj);

  // Lexical scope
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }

  myFunction();

  // Lexical closures
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  print('add2: ${add2(3)}');
  print('add4: ${add4(3)}');

  Function x;

  // Comparing top-level functions.
  x = foo;
  print('foo == x : ${foo == x}');

  // Comparing static methods.
  x = A.bar;
  print('A.bar == x : ${A.bar == x}');

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // These closures refer to the same instance (#2),
  // so they're equal.
  print('y.baz == x : ${y.baz == x}');

  // These closures refer to different instances,
  // so they're unequal.
  print('v.baz != w.baz : ${v.baz != w.baz}');

  // return values
  returnFunc() {}

  print('foo() == null : ${returnFunc() == null}');

  (String, int) returnFunc2() {
    return ('a', 1);
  }

  print('returnFunc2() : ${returnFunc2()}');

  // Generators
  Iterable<int> naturalsTo(int n) sync* {
    int k = 0;
    while (k < n) yield k++;
  }

  print('naturalsTo(5) : ${naturalsTo(5)}');

  // Asynchronous Generators
  Stream<int> asynchronousNaturalsTo(int n) async* {
    int k = 0;
    while (k < n) yield k++;
  }

  asynchronousNaturalsTo(5).forEach((element) {
    print(element);
  });
}

void printElementObj(element) {
  print(element);
}

void printElement(int element) {
  print(element);
}

var _nobleGases = [1, 2, 3];

bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

bool isNoble2(int atomicNumber) => _nobleGases[atomicNumber] != null;

isNobleIgnoreType(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

void enableFlags({bool? bold, bool? hidden}) {}

void enableFlags2({bool bold = false, bool hidden = false}) {}

void enableFlags3({bool? bold, required bool hidden}) {}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

String say2(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}
