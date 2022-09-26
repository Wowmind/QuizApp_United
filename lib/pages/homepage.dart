import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:united_quiz/pages/answer.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _questionIndex = 0;
  int _totalScores = 0;
  bool answerWasSelected = false;
  bool endQuiz = false;

  void questionAnswered(answerSelected){
    setState((){
      if(answerSelected) {
        _totalScores++;
      }

      answerWasSelected = true;

      if(_questionIndex + 1 == _questions.length) {
        endQuiz = true;
      }
    });
    }

    void NextQuestion(){
    setState((){
      answerWasSelected = false;
      _questionIndex++;
    });
    if(_questionIndex >= _questions.length) {
      reset();
    }
    }

    void reset(){
    setState((){
      _totalScores = 0;
      _questionIndex = 0;
      endQuiz = false;
    });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                  ),
                  child: Text('${_questionIndex.toString()}/${_questions.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin:const EdgeInsets.only(right: 10),
                    padding:const  EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                    ),
                    child:const  Text('X',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(_questions[_questionIndex]['images'].toString()),
              )
            ),

          ),
          const SizedBox(height: 30,),

          Center(
            child: Text(_questions[_questionIndex]['question'].toString(),
            style:const  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            ),
          ),
          const SizedBox(height: 20,),

          ... (_questions[_questionIndex]['answer'] as List<Map<String, dynamic>>)
              .map((answerr) => Answer(
              answers: answerr['answers'],
              answerColor: answerWasSelected? answerr['score'] ? Colors.red: Colors.black : Colors.black,
              callback: (){
                if(answerWasSelected){
                  return;
                }
                questionAnswered(answerr['score']);
              })),

          InkWell(
            onTap: () {
              if(!answerWasSelected){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'Please insert an answer before going to the next page'
                    )));
                return;
              }
              NextQuestion();
            },
            child: Container(
              height: 40,
              width: double.infinity,
              margin:const  EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                child: Text(endQuiz? 'Restart': 'Next Question',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ),
/*
         LinearPercentIndicator(
           percent: _questionIndex.toDouble(),
           progressColor: Colors.red,
           animation: true,
           animationDuration: 1000,
           backgroundColor: Colors.black,
           width: 8,
           lineHeight: 10,



         ),
*/


        ],
      ),
    );
  }
}

final _questions = [
  {
    'question': 'How many Champion League has \nMan united won?',
    'images': 'assets/champion.jpg',
    'answer': [
      {'answers': '7', 'score': false},
      {'answers': '3', 'score': true},
      {'answers': '4', 'score': false},
    ]
  },

  {
    'question': 'What number is Marcos Rashford \nwearing?',
    'images': 'assets/rash.jpg',
    'answer': [
      {'answers': '10', 'score': true},
      {'answers': '9', 'score': false},
      {'answers': '8', 'score': false},
    ]
  },
  {
    'question': 'Who was the next manager after \nSir Alex Fergueson?',
    'images': 'assets/fergie.jpg',
    'answer': [
      {'answers': 'Jose Mourinho', 'score': false},
      {'answers': 'Ryan Giggs', 'score': false},
      {'answers': 'David Moyes', 'score': true},
    ]
  },

  {
    'question': 'How many goals has C.Ronaldo scored \nthis season?',
    'images': 'assets/ronaldo.jpg',
    'answer': [
      {'answers': '1', 'score': true},
      {'answers': '2', 'score': false},
      {'answers': '5', 'score': false},
    ]
  },

  {
    'question': 'What number is Anthony wearing this season?',
    'images': 'assets/antho.jpg',
    'answer': [
      {'answers': '14', 'score': false},
      {'answers': '21', 'score': true},
      {'answers': '7', 'score': false},
    ]
  }

];