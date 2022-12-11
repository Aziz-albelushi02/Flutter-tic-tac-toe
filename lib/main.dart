import 'package:flutter/material.dart';
import 'package:tic_tac_toe/UI/theme/color.dart';
import 'package:tic_tac_toe/utils/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // adding the important values
  String lastValue = 'X';
  Game game = Game();
  bool gameOver = false;
  int turn = 0; //check if draw
  String result = '';
  List<int> scoreboard = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; // the score for the different combination of the game [Row1,2,3 Col 1,2,3]

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Its ${lastValue} turn".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 58,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                width: boardWidth,
                height: boardWidth,
                child: GridView.count(
                    crossAxisCount: Game.boardlenth ~/ 3,
                    padding: EdgeInsets.all(16.0),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    children: List.generate(Game.boardlenth, (index) {
                      return InkWell(
                          onTap: gameOver
                              ? null
                              : () {
                                  // when we click we need to add the new value to the board and refresh the screen
                                  // set toggle player JIC
                                  if (game.board![index] == '') {
                                    setState(() {
                                      game.board![index] = lastValue;
                                      turn++;
                                      gameOver = game.winnerCheck(
                                          lastValue, index, scoreboard, 3);
                                        if(gameOver){
                                          result = "$lastValue IS THE WINNER";
                                        } else if(!gameOver && turn == 9){
                                          result = "it is a draw";
                                          gameOver = true;
                                        }
                                      if (lastValue == 'X')
                                        lastValue = 'O';
                                      else
                                        lastValue = 'X';
                                    });
                                  }
                                },
                          child: Container(
                            width: Game.blocSize,
                            height: Game.blocSize,
                            decoration: BoxDecoration(
                              color: MainColor.SecondAnyColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Center(
                                child: Text(
                              game.board![index],
                              style: TextStyle(
                                color: game.board![index] == "X"
                                    ? Colors.blue
                                    : Colors.pink,
                                fontSize: 64.0,
                              ),
                            )),
                          ));
                    }))),
                    SizedBox(
                      height: 25.0,
                    ), Text(result, style: TextStyle(color: Colors.white, fontSize: 35.0),),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  // erase the board
                  game.board = Game.initGameBoard();
                  lastValue = 'X';
                  gameOver = false;
                  turn = 0;
                  result = '';
                  scoreboard = [0,0,0,0,0,0,0,0];
                });
              },
              icon: Icon(Icons.replay),
              label: Text('Repeat the game'),
            )
          ]),
    );
  } // the first step is to organize our folder structucture

}
