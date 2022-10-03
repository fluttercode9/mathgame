import 'package:flutter/material.dart';
import 'package:mathgame/IMode.dart';
import 'package:mathgame/addMode.dart';
import 'package:mathgame/const.dart';
import 'package:mathgame/game.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  IMode exps = AddMode();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Game(AddMode()))
      ],
      child: MaterialApp(
        home: GameScreen(),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
  }

  String? userAnswer;

  @override
  Widget build(BuildContext context) {
    Game game = Provider.of<Game>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          
          Container(
            height: 200,
   
            child: Center(
              child: Text(
                '${game.currentExpression} = ${game.userAnswer}',
                style: keyboardText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 500,
            child: GridView.count(
                padding: EdgeInsets.all(12),
                crossAxisCount: 4,
                children: game.keys
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: GridKey(e),
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }

  GestureDetector GridKey(
    String e,
  ) {
    var buttonColor;
    void Function()? onTap;
    Game game = Provider.of<Game>(context);

    switch (e) {
      case 'C':
        buttonColor = Colors.green;
        break;
      case 'DEL':
        buttonColor = Colors.red;
        break;
      case '=':
        buttonColor = Colors.yellow;
        onTap =() => game.evaluateAnswer();
        break;

      default:
        print('s');
        buttonColor = Colors.pink;
        onTap = () => game.addToAnswer(e);
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        color: buttonColor,
        child: Center(
          child: Text(
            e,
            style: keyboardText,
          ),
        ),
      ),
    );
  }
}
