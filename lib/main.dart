import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask A Question!"),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  String _text = "";
  var _answers = ["Yes!", "No!", "Ask Again\nLater", "Decidedly\nSo"];
  var _ball = ["images/magic8ball1.jpeg", "images/magic8ball2.jpeg"];
  var _indexText = 0;
  var _indexImage = 0;
  var _space = "";
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        _indexText = Random().nextInt(4);
        _indexImage = Random().nextInt(2);
        if (_indexText >= 2 && _indexImage == 1) {
          _space = "\n";
        } else {
          _space = "";
        }
        setState(() {
          _text = _space + _answers[_indexText];
        });
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(_ball[_indexImage]),
            ),
          ),
          Center(
            child: Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade400),
            ),
          ),
        ],
      ),
    );
  }
}
