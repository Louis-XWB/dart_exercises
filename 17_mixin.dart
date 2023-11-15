void main() {
  var maestro = Maestro();
  maestro.perform();

  maestro.performAggressive();
  maestro.performAggressive2();
  maestro.performMusician();
}

class Performer {
  void perform() {
    print('Performing...');
  }
}

class Musician extends Performer {
  void perform() {
    super.perform();
    print('Singing...');
  }
}

mixin MusicianLimited on Musician {
  void performMusician() {
    super.perform();
    print('MusicianLimited Singing...');
  }
}

mixin Aggressive {
  void performAggressive() {
    print('Aggressive...');
  }

  void performAggressive2() {
    print('Aggressive2...');
  }
}

class Dancer extends Performer with Aggressive {
  void perform() {
    super.perform();
    print('Dancing...');
  }
}

class Maestro extends Musician with Aggressive, MusicianLimited {
  void perform() {
    super.perform();
    print('Directing...');
  }
}

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

abstract mixin class MusicianAbstract {
  // No 'on' clause, but an abstract method that other types must define if
  // they want to use (mix in or extend) Musician:
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }

  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with MusicianAbstract {
  // Use Musician as a mixin
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }
}

class Novice extends MusicianAbstract {
  // Use Musician as a class
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName poorly');
  }
}
