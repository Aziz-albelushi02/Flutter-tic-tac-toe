

class Player{
  static const x = 'X';
  static const o = 'O';
  static const empty = '';
}

class Game{
  static final boardlenth = 9; //we will create 3 blocks;
  static final blocSize = 100.0;


// creating the final board 

List<String>? board;
static List<String>? initGameBoard() => List.generate(boardlenth, (index) => Player.empty);

}