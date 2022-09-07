import 'dart:math';

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null) return contains(x) && contains(y);
    return contains(x) && contains(y) && contains(z);
  }
}

class Player {
  static List<int> validPlaces = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  static List<int> Playerx = [];
  static List<int> playero = [];
  static List<int> optimalMove = [];
}

class Game {
  static optimalGame() {
    print(Player.validPlaces);
    print(Player.Playerx.containsAll(1, 2));
    for (int i = 0; i < Player.validPlaces.length; i++) {
      if (Player.validPlaces[i] == 0 &&
          (Player.Playerx.containsAll(1, 2) ||
              Player.Playerx.containsAll(3, 6) ||
              Player.Playerx.containsAll(4, 8))) {
        print('here');
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 1 &&
          (Player.Playerx.containsAll(0, 2) ||
              Player.Playerx.containsAll(4, 7))) {
        Player.optimalMove.add(Player.Playerx[i]);
      }
      if (Player.validPlaces[i] == 2 &&
          (Player.Playerx.containsAll(1, 0) ||
              Player.Playerx.containsAll(5, 8) ||
              Player.Playerx.containsAll(4, 6))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 3 &&
          (Player.Playerx.containsAll(4, 5) ||
              Player.Playerx.containsAll(0, 6))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 4 &&
          (Player.Playerx.containsAll(1, 7) ||
              Player.Playerx.containsAll(3, 5) ||
              Player.Playerx.containsAll(0, 8) ||
              Player.Playerx.containsAll(2, 6))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 5 &&
          (Player.Playerx.containsAll(3, 4) ||
              Player.Playerx.containsAll(2, 8))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 6 &&
          (Player.Playerx.containsAll(0, 1) ||
              Player.Playerx.containsAll(7, 8) ||
              Player.Playerx.containsAll(4, 2))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 7 &&
          (Player.Playerx.containsAll(6, 8) ||
              Player.Playerx.containsAll(4, 1))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == '0' &&
          (Player.Playerx.containsAll(1, 2) ||
              Player.Playerx.containsAll(3, 6) ||
              Player.Playerx.containsAll(4, 8))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 8 &&
          (Player.Playerx.containsAll(5, 2) ||
              Player.Playerx.containsAll(7, 6) ||
              Player.Playerx.containsAll(4, 0))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
    }
    for (int i = 0; i < Player.validPlaces.length; i++) {
      if (Player.validPlaces[i] == 0 &&
          (Player.playero.containsAll(1, 2) ||
              Player.playero.containsAll(3, 6) ||
              Player.playero.containsAll(4, 8))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 1 &&
          (Player.playero.containsAll(0, 2) ||
              Player.playero.containsAll(4, 7))) {
        Player.optimalMove.add(Player.Playerx[i]);
      }
      if (Player.validPlaces[i] == 2 &&
          (Player.playero.containsAll(1, 0) ||
              Player.playero.containsAll(5, 8) ||
              Player.playero.containsAll(4, 6))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 3 &&
          (Player.playero.containsAll(4, 5) ||
              Player.playero.containsAll(0, 6))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 4 &&
          (Player.playero.containsAll(1, 7) ||
              Player.playero.containsAll(3, 5) ||
              Player.playero.containsAll(0, 8) ||
              Player.playero.containsAll(2, 6))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 5 &&
          (Player.playero.containsAll(3, 4) ||
              Player.playero.containsAll(2, 8))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 6 &&
          (Player.playero.containsAll(0, 1) ||
              Player.playero.containsAll(7, 8) ||
              Player.playero.containsAll(4, 2))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 7 &&
          (Player.playero.containsAll(6, 8) ||
              Player.playero.containsAll(4, 1))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == '0' &&
          (Player.playero.containsAll(1, 2) ||
              Player.playero.containsAll(3, 6) ||
              Player.playero.containsAll(4, 8))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
      if (Player.validPlaces[i] == 8 &&
          (Player.playero.containsAll(5, 2) ||
              Player.playero.containsAll(7, 6) ||
              Player.playero.containsAll(4, 0))) {
        Player.optimalMove.add(Player.validPlaces[i]);
      }
    }
  }

  static PlayGame(index, activePlayer) {
    //print(Player.Playerx);
    Player.validPlaces.removeWhere((element) => element == index);
    if (activePlayer == 'X')
      Player.Playerx.add(index);
    else
      Player.playero.add(index);
  }

  static String checkWinner() {
    //print(Player.playero);
    String winner = '';
    if (Player.Playerx.containsAll(0, 1, 2) ||
        Player.Playerx.containsAll(3, 4, 5) ||
        Player.Playerx.containsAll(6, 7, 8) ||
        Player.Playerx.containsAll(0, 3, 6) ||
        Player.Playerx.containsAll(1, 4, 7) ||
        Player.Playerx.containsAll(2, 5, 8) ||
        Player.Playerx.containsAll(0, 4, 8) ||
        Player.Playerx.containsAll(2, 4, 6)) winner = 'X';
    if (Player.playero.containsAll(0, 1, 2) ||
        Player.playero.containsAll(3, 4, 5) ||
        Player.playero.containsAll(6, 7, 8) ||
        Player.playero.containsAll(0, 3, 6) ||
        Player.playero.containsAll(1, 4, 7) ||
        Player.playero.containsAll(2, 5, 8) ||
        Player.playero.containsAll(0, 4, 8) ||
        Player.playero.containsAll(2, 4, 6)) winner = 'O';

    return winner;
  }

  static autoplay(activePlayer) {
    print(Player.optimalMove);
    optimalGame();
    if (Player.optimalMove.length > 0) {
      Random random = Random();
      int randomIndex = random.nextInt(Player.optimalMove.length);
      int index = Player.optimalMove[randomIndex];
      print(Player.optimalMove);
      Player.optimalMove.clear();
      print(Player.optimalMove);
      PlayGame(index, activePlayer);
    } else if (Player.validPlaces.length > 0) {
      Random random = Random();
      int randomIndex = random.nextInt(Player.validPlaces.length);
      int index = Player.validPlaces[randomIndex];
      PlayGame(index, activePlayer);
    }
  }
}
