import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DiceRollMain());
}

class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  _DiceRollState createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceNumber1 = 1;
  int diceNumber2 = 1;
  int diceTotal =  2;

  void rollDice() {
    setState(() {
      diceNumber1 = Random().nextInt(6) + 1;
      diceNumber2 = Random().nextInt(6) + 1;
      diceTotal = diceNumber1 + diceNumber2;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Dice Roll App'),
        ),
        body: Center(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            TextButton(
              onPressed: rollDice,
              child: Image.asset("images/dice-$diceNumber1.png",
                width: 150, height: 150),
                ),
            TextButton(
              onPressed: rollDice,
              child: Image.asset("images/dice-$diceNumber2.png",
                width: 150, height: 150),
                )
          ]),
          Text("You rolled a $diceNumber1 and a $diceNumber2 for a total roll of: $diceTotal")
        ])));
  }
}

