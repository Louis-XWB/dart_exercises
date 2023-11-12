void main() {
  void testThrow() {
    throw FormatException('Expected at least 1 section');
  }

  try {
    testThrow();
  } catch (e) {
    print('catch: $e');
  }

  try {
    testThrow();
  } on FormatException {
    print('on FormatException');
  } catch (e) {
    print('catch: $e after on');
  } finally {
    print('finally');
  }

  try {
    testThrow();
  } on FormatException catch (e) {
    print('on FormatException: $e');
  } catch (e) {
    print('catch: $e after on');
  } finally {
    print('finally');
  }

  try {
    testThrow();
  } catch (e, s) {
    print('catch: $e');
    print('stack trace: $s');
  }

  void misbehave() {
    try {
      dynamic foo = true;
      print(foo++); // Runtime error
    } catch (e) {
      print('misbehave() partially handled ${e.runtimeType}.');
      rethrow; // Allow callers to see the exception.
    }
  }

  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}
