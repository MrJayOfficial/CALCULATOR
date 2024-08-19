import 'package:flutter/material.dart';

import 'package:secondcalc/buttons/row1button.dart';
import 'package:expressions/expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();

  void onPressed(String value) {
    if (value.trim() == '=') {
      Expression exp = Expression.parse(_textController.text);
      var evaluator = const ExpressionEvaluator();
      Map<String, dynamic> s = {};

      var resultText = evaluator.eval(exp, s);
      _textController.text = resultText.toString();
    } else if (value.trim() == 'AC') {
      _textController.text = '';
    } else if (value.trim() == 'x') {
      var length = _textController.text.length;
      var value = _textController.text.substring(0, length - 1);
      _textController.text = value;
    } else {
      _textController.text += value.trim();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 50),
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  readOnly: true,
                  controller: _textController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 50),
                      // labelText: _textController.text,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110),
                width: double.infinity,
                color: Colors.green[200],
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonRow(
                      first: 'AC',
                      second: 'x   ',
                      third: '+/-',
                      four: '/   ',
                      onPressed: onPressed,
                    ),
                    ButtonRow(
                      first: '7  ',
                      second: '8  ',
                      third: '9   ',
                      four: '*   ',
                      onPressed: onPressed,
                    ),
                    ButtonRow(
                      first: '4  ',
                      second: '5   ',
                      third: '7   ',
                      four: '-    ',
                      onPressed: onPressed,
                    ),
                    ButtonRow(
                      first: '1  ',
                      second: '2   ',
                      third: '3    ',
                      four: '+   ',
                      onPressed: onPressed,
                    ),
                    ButtonRow(
                      first: '%  ',
                      second: '0   ',
                      third: '-   ',
                      four: '=   ',
                      onPressed: onPressed,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
