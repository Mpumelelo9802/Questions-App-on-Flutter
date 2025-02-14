import 'package:flutter/material.dart';
import 'package:flutter_page/data/questions.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_page/questions_screen.dart';
import 'package:flutter_page/start_screen.dart';
import 'package:flutter_page/results_screen.dart';
// import 'package:flutter_page/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}



class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void chooseAnswer(String answer){
  selectedAnswers.add(answer);

  if(selectedAnswers.length == questions.length){
    setState(() {
      activeScreen = 'results-screen';
    });
  }
}

  @override
  void initState() {
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }

    if(activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(chosenAnswers: selectedAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
