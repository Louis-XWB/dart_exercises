void main() {
  var television = Television();
  television.turnOn();
  television.contrast = 10;

  var smartTelevision = SmartTelevision();
  smartTelevision.turnOn();
  smartTelevision.contrast = 8;

  // noSuchMethod
  dynamic testNoSuchMethod = TestNoSuchMethod();
  testNoSuchMethod.someMethod();
}

class Television {
  void turnOn() {
    print('Television is turned on!');
  }

  set contrast(int value) {
    print('Contrast is set to $value');
  }
}

class SmartTelevision extends Television {
  @override
  void turnOn() {
    super.turnOn();
    print('Searching for Wi-Fi...');
    print('Wi-Fi found!');
  }

  @override
  set contrast(int value) {
    super.contrast = value;
    print('SmartTelevision Contrast is set to $value');
  }
}

class TestNoSuchMethod {
  @override
  noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}
