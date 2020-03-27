//Packages
import 'package:flutter/material.dart';

//Own files

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //hacemos conexion con la clase de arriba, el _ hace que nos e pueda usar en otro archivo, se hace privada
  var _questionIndex = 0; // o int
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Cual es tu color favorito?',
      'answers': [{'text': 'Negro', 'score': 10}, {'text':'Rojo' ,'score': 5}, {'text': 'Verde', 'score': 3}]
    },
    {
      'questionText': 'Cual es tu animal favorito?',
      'answers': [{'text': 'Perritu', 'score': 10}, {'text':'Cuyo' ,'score': 5}, {'text': 'Gato', 'score': 3}]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('hay mas preguntas');
    } else {
      print('ya no hay preguntas!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Título de la app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
