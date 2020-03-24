//Packages
import 'package:flutter/material.dart';
//Own files
import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> { //hacemos conexion con la clase de arriba, el _ hace que nos e pueda usar en otro archivo, se hace privada
  var _questionIndex = 0; // o int

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['Buenas?', 'Noches?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Título de la app'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
