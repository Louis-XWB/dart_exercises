// Collections
void main() {
  // List
  var list = [1, 2, 3];

  var list2 = [
    'Car',
    'Boat',
    'Plane',
  ];

  // 要创建一个编译时常量列表，请在列表文字之前添加 const ：
  var constantList = const [1, 2, 3];
  //constantListp[2] = 5;

// Sets
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);

  var elements2 = <String>{};
  elements2.add('fluorine');
  elements2.addAll(halogens);
  assert(elements2.length == 5);

  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };

  // Maps
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  var gifts2 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var gifts3 = {'first': 'partridge'};
  gifts['fourth'] = 'calling birds'; // Add a key-value pair

  var gifts4 = {'first': 'partridge'};
  assert(gifts4['first'] == 'partridge');

  // 如果map中没有的key，将返回 null：
  var gifts5 = {'first': 'partridge'};
  assert(gifts['fifth'] == null);

  //使用 .length 获取映射中键值对的数量：
  var gifts6 = {'first': 'partridge'};
  assert(gifts6.length == 1);

  // 要创建一个编译时常量的映射，请在映射文字之前添加 const ：
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

// constantMap[2] = 'Helium'; // This line will cause an error.

  //Operators
  var list3 = [1, 2, 3];
  var list4 = [0, ...list3, 5, 6, 7];
  print(list4);

  // 如果扩展运算符右侧的表达式可能为 null，则可以使用支持 null 的扩展运算符 ( ...? ) 来避免异常：
  var list5 = [0, ...?list];
  assert(list2.length == 1);

  // Control-flow operators
  var nav = ['Home', 'Furniture', 'Plants', if (list5.length == 1) 'Outlet'];
  print(nav);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings);
}
