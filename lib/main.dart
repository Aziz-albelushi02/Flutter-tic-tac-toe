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
  String lastValue = 'X';
  Game game = Game();
  bool gameOver = false;
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
                        onTap:gameOver ?null : () {
                          // when we click we need to add the new value to the board and refresh the screen
                          // set toggle player JIC
                          setState(() {
                            game.board![index] = lastValue;
                            
                          });

                        } ,


                      child: Container(
                        width: Game.blocSize,
                        height: Game.blocSize,
                        decoration: BoxDecoration(
                            color: MainColor.SecondAnyColor,
                            borderRadius: BorderRadius.circular(16.0),),
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
                    })))
          ]),
    );
  } // the first step is to organize our folder structucture

}
