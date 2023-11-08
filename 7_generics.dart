void main() {
  var names = <String>[];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  //names.add(42); // Error

  var pages = <String, String>{};
  pages
      .addAll({'index.html': 'Homepage', 'robots.txt': 'Hints for web robots'});

  //将参数化类型与构造函数一起使用
  var nameSet = Set<String>.from(names);
  var views = Map<int, String>();

  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names is List<String>); // true

  var foo = Foo2();
  print(foo);

  // 指定任何非 SomeBaseClass 类型都会导致错误：
  // var foo2 = Foo2<Object>();
}

abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}

class SomeBaseClass {}

class Foo2<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'Foo<$T>'";
}

var someBaseClassFoo = Foo2<SomeBaseClass>();

class Extender extends SomeBaseClass {}

var extenderFoo = Foo2<Extender>();

T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
