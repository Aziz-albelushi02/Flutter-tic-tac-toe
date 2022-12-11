import 'package:flutter/cupertino.dart';

class Player {
  static const x = 'X';
  static const o = 'O';
  static const empty = '';
}

class Game {
  static final boardlenth = 9; //we will create 3 blocks;
  static final blocSize = 100.0;

// creating the final board

  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(boardlenth, (index) => Player.empty);

  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    int row = index ~/ 3;
    int col = index ~/ 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score;
    scoreboard[gridSize + col] += score;
    if (row == col) scoreboard[2 * gridSize] += score;
    if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1];

//checking if we have 3 or -3 in the score board

    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }

//by default is will return false

    return false;
  }
}

//building the winner check algorithms
