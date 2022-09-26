import 'package:flutter/material.dart';
import 'package:united_quiz/pages/homepage.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/manu.jpg')
              ),
            ),
          ),
         const Positioned(
            right: 0,
            top: 40,
            child: Icon(
              Icons.cancel,
              color: Colors.white,),
          ),

          const Positioned(
             left: 20,
             bottom: 50,
             child: Text('QUIZ: HOW WELL DO \nYOU KNOW UNITED?',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white,
          ),
          ),
           ),

           Positioned(
            right: 20,
            bottom: 20,
            child: InkWell(
              child:const Text('SWIPE TO START >',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
            ),
          ),

          Positioned(
            left: 100,
            bottom: 140,
            child: Container(
              height: 4,
              width: 150,
              color: Colors.white,
            ),
          )


        ],
      ),
    );
  }
}
