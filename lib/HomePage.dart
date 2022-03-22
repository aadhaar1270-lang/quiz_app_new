import 'package:flutter/material.dart';
import './model/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List questionBank = [
    Question.name('A lunar eclipse occurs when the sun passes', true),
    Question.name('The earth is the fourth planet from the sun', false),
    Question.name('The planet Venus has no moons.', false),
    Question.name('Jupiter is composed mostly of iron.', true),
    Question.name('The sun is a star of average size', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('True Citizen'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
          //margin: EdgeInsets.all(20.0),
          //height: 180,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/flag.png',
              width: 250,
              height: 180,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(
                    color: Colors.blueGrey.shade400,
                    style: BorderStyle.solid,
                  )),
              height: 120,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  questionBank[_index % questionBank.length].questionText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style:
                ElevatedButton.styleFrom(primary: Colors.blueGrey.shade900),
                onPressed: () => prevQuestion(),
                child: Icon(Icons.arrow_back),
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.blueGrey.shade900),
                onPressed: () => checkAnswer(true),
                child: Text('TRUE'),
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.blueGrey.shade900),
                onPressed: () => checkAnswer(false),
                child: Text('FALSE'),
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.blueGrey.shade900),
                onPressed: () => nextQuestion(),
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
          Spacer(),
        ],
      )),
    );
  }

  void checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_index % questionBank.length].isCorrect) {
      debugPrint('yes correct');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
          content: Text(
            'Yes, Correct!',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
      updateQuestion();
    } else {
      debugPrint('Incorrect');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
          content: Text(
            'Oops, Incorrect!',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
             // fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
      updateQuestion();
    }
  }

  void updateQuestion() {
    setState(() {
      _index = (_index + 1)% questionBank.length;
    });
  }

  void prevQuestion() {
    setState(() {
      _index = (_index - 1)% questionBank.length;
    });
  }

  void nextQuestion() {
    updateQuestion();
  }
}
