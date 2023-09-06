import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:second_app/answer_button.dart';
import 'package:second_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
   const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
    });

 

  
   final void Function(String answer) onSelectedAnswer;


  @override
  State<QuestionScreen> createState() {
   return _QuestionScreenState();
  }
  
  // void onSelectAnswer(String s) {}
}

class _QuestionScreenState extends State<QuestionScreen>{
  var currentQuestionIndex =0;

  void answerQuestion(String selectedAnswers){
    widget.onSelectedAnswer(selectedAnswers);
    setState(() {
       currentQuestionIndex++;
    });
   

  }

  @override
  Widget build(context) {
    final currentQuestion= questions[currentQuestionIndex];

  return SizedBox(
    width: double.infinity,
    child: Container(
      margin:const EdgeInsets.all(40),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center ,
         crossAxisAlignment: CrossAxisAlignment.stretch,
    
        children:  [
        Text(currentQuestion.text,
         style: GoogleFonts.lato(
          color: const Color.fromARGB(255, 204, 255, 252),
          fontSize: 24,
          fontWeight: FontWeight.bold,
         ),
        textAlign: TextAlign.center,
        ),
        const SizedBox(height : 30),
        ...currentQuestion.getShuffledAnswers().map((answer) {
          return AnswerButton(
            answerText:answer ,
             onTap:() {
              answerQuestion(answer);
             },
             );
        })
       
      
      ],),
    ),
  );
  }
}


