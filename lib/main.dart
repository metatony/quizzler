import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 21, 21, 21),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = const [];

  QuizBrain quizBrain = QuizBrain();

  int questionNumber = 0;
  //////////
  void nextQuestion() {
    if (questionNumber < quizBrain.questionBank.length - 1) {
      questionNumber++;
    }
  }

  bool isFinished() {
    if (questionNumber >= quizBrain.questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.

                bool correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;

                if (isFinished() == true) {
                  Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'You\'ve reached the end of the quiz.',
                  ).show();

                  reset();

                  scoreKeeper = [];
                } else {
                  if (correctAnswer == true) {
                    print('user got it right');
                  } else {
                    print('user got it wrong');
                  }
                }

                setState(() {
                  nextQuestion();
                });
                print(questionNumber);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.

                bool correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;

                if (isFinished() == true) {
                  Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'You\'ve reached the end of the quiz.',
                  ).show();

                  reset();

                  scoreKeeper = [];
                } else {
                  if (correctAnswer == false) {
                    print('user got it right');
                  } else {
                    print('user got it wrong');
                  }
                }

                setState(() {
                  nextQuestion();
                });
                print(questionNumber);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper, //scoreKeeper list
        )
      ],
    );
  }
}


 // List<Question> questionBank = [
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(
  //       q: 'Approximately one quarter of human bones are in the feet.',
  //       a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true)
  // ];