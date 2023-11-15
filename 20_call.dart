void main() {
  var wf = WannabeFunction();
  var out = wf('Hi', 'there,', 'gang');
  print(out);
}

class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}
