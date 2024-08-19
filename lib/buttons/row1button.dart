import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonRow extends StatelessWidget {
  ButtonRow(
      {super.key,
      required this.onPressed,
      required this.first,
      required this.second,
      required this.third,
      required this.four});

  final String first;
  final String second;
  final String third;
  final String four;

  Function(String value) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              onPressed(first);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(30),
            ),
            child: Text(first)),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              onPressed(second);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(30),
              backgroundColor: Colors.white,
            ),
            child: Text(second)),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              onPressed(third);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(30),
              backgroundColor: Colors.white,
            ),
            child: Text(third)),
        const SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              onPressed(four);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(30),
              backgroundColor: Colors.white,
            ),
            child: Text(four)),
        const SizedBox(width: 10),
      ],
    );
  }
}
