import 'package:flutter/material.dart';
import 'package:new_quiz_app/answer_button.dart';
import 'package:new_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key , required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 192, 146, 235),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswer().map(
              (answer) {
                return AnswerButton(answer, () {
                  return answerQuestion(answer);
                });
              },
            ),
            //****instead of using individual buttons we have use map for
            //converting the item to a widget based on the item */
            // AnswerButton(
            //   currentQuestion.answers[0],
            //   () {},
            // ),
            // AnswerButton(
            //   currentQuestion.answers[1],
            //   () {},
            // ),
            // AnswerButton(
            //   currentQuestion.answers[2],
            //   () {},
            // ),
            // AnswerButton(
            //   currentQuestion.answers[3],
            //   () {},
            // ),
          ],
        ),
      ),
    );
  }
}
