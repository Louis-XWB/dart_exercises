void main() {
  var message = StringBuffer('Dart is fun');

  print('message: $message');

  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
  print('message2: $message');

  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());

  for (final callback in callbacks) {
    callback();
  }

  var collection = [0, 1, 2];
  print('collection: $collection');
  for (var x in collection) {
    print(x);
  }
  collection.forEach(print);

  var mapping = {'name': 'Bob', 'age': 18};
  print('map keys: ${mapping.keys}');
  for (var entry in mapping.entries) {
    print('${entry.key}: ${entry.value}');
  }

  var candidates = [];
  candidates.add(Candidate('Bob', 0));
  candidates.add(Candidate('Alice', 1));

  for (var candidate in candidates) {
    candidate.printVotes();
  }

  for (final Candidate(:name, :votes) in candidates) {
    print('$name: $votes');
  }

  final pair = [2, 5];
  if (pair case [int x, int y]) {
    var point = Point(x, y);
    print('point: $point');
  }

  // switch
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      print('CLOSED');
      break;
    case 'PENDING':
      print('PENDING');
      break;
    case 'APPROVED':
      print('APPROVED');
      break;
    case 'DENIED':
      print('DENIED');
      break;
    case 'OPEN':
      print('OPEN');
      break;
    default:
      print('default');
  }

  // continue
  for (var i = 0; i < 5; i++) {
    if (i == 3) continue;
    print(i);
  }

  // Switch expressions
  var command2 = 'OPEN';
  var myCommandValue = switch (command2) {
    'OPEN' => 'OPENOPEN',
    'CLOSED' => 'CLOSEDCLOSED',
    _ => 'UNKNOWN',
  };
  print('myCommandValue: $myCommandValue');
}

class Candidate {
  final String name;
  final int votes;

  const Candidate(this.name, this.votes);

  void printVotes() {
    print('$name has $votes');
  }
}

class Point {
  final num x;
  final num y;

  const Point(this.x, this.y);

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  Point operator *(num factor) {
    return Point(x * factor, y * factor);
  }

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }
}
