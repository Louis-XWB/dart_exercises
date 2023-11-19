void main() async {
  // Future
  await checkVersion();

  // stream
  var streamItems = Stream.fromIterable([1, 2, 3]);
  await for (var item in streamItems) {
    print(item);
  }
}

//要使用 await ，代码必须位于 async 函数中 - 标记为 async 的函数：
Future<void> checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
  print('version: $version');
}

// implement lookUpVersion function
Future<int> lookUpVersion() async {
  return 1;
}

String lookUpVersion2() => '1.0.0';

Future<String> lookUpVersion3() async => '1.0.0';

// 

