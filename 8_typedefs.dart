typedef IntList = List<int>;

typedef ListMapper<X> = Map<X, List<X>>;

typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  // Typedefs
  // typedefs 是一种类型别名，允许您为函数类型和复杂类型提供别名
  // typedefs 可以使代码更易于阅读和理解
  // typedefs 可以使代码更易于重构
  // typedefs 可以提供更好的文档
  // typedefs 可以帮助您避免不必要的命名
  // typedefs 可以帮助您避免不必要的类
  IntList vil = [1, 2, 3];

  Map<String, List<String>> m1 = {}; // Verbose.
  ListMapper<String> m2 = {}; // Same thing but shorter and clearer.

  // 在大多数情况下，我们建议使用内联函数类型而不是函数的 typedef。然而，函数 typedef 仍然有用：
  assert(sort is Compare<int>); // True!
}
