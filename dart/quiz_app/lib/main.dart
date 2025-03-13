import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int groupValue = 2;
  int currentQuestion = 0;
  int score = 0;
  String result = "";
  Color resultColor = Colors.black;
  var questions = [
    'The Earth is flat',
    'The capital of France is London',
    'Flutter is a mobile UI framework'
  ];
  
  var answers = [0, 0, 1];
  void checkAnswer(int answer) {
    setState(() {
      groupValue = answer;
      
      if (answers[currentQuestion] == answer) {
        print("correct");
        score++;
        result = "CORRECT";
        resultColor = Colors.green;
      } else {
        print("incorrect");
        result = "INCORRECT";
        resultColor = Colors.red;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      groupValue = 2;
      
      result = "";
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        currentQuestion = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Question ${currentQuestion + 1}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              questions[currentQuestion],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) => checkAnswer(e!),
                ),
                Text("True", style: TextStyle(fontSize: 16)),
                SizedBox(width: 50),
                Radio(
                  activeColor: Colors.blue,
                  value: 0,
                  groupValue: groupValue,
                  onChanged: (e) => checkAnswer(e!),
                ),
                Text("False", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 30),
            TextButton(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              onPressed: () {
                nextQuestion();
              },
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                color: resultColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Score: $score",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}