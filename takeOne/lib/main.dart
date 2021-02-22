import 'package:flutter/material.dart';
import "./question.dart";
import "./answer.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //the _ turns the class from public to private
  var _questionIndex = 0;

  final questions = const [
    {
      "questionText": "What is your favorite market",
      "answers": ["Euro", "American", "JDM", "Exotics"]
    },
    {
      "questionText": "What is your favorite track",
      "answers": ["SPA", "Nurburg", "Yas marina", "Monza"]
    },
    {
      "questionText": "What is your favorite catagory",
      "answers": ["Sedan", "Coupe", "SUV", "Hot Hatch"]
    },
  ]; //array

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print("We have more questions!");
    } else {
      _questionIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]["questionText"],
            ),
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
