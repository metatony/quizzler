import 'package:flutter/material.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(137, 31, 31, 31),
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: SafeArea(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
