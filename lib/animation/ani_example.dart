import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationExample extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/waiting.json'),
            SizedBox(height: 10,),

          
            Lottie.asset('assets/animations/circularProgress.json'),
            SizedBox(height: 10,),
           Lottie.asset('assets/animations/progress.json'),
            SizedBox(height: 10,),

            Lottie.asset('assets/animations/loading.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading1.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading2.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading3.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading4.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading5.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading6.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading7.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/loading8.json'),
            SizedBox(height: 10,),

             Lottie.asset('assets/animations/processing.json'),
            SizedBox(height: 10,),
             Lottie.asset('assets/animations/processing1.json'),
            SizedBox(height: 10,),
            //  Lottie.asset('assets/animations/processing2.json'),
            // SizedBox(height: 10,),
            //  Lottie.asset('assets/animations/processing3.json'),
            // SizedBox(height: 10,),
             Lottie.asset('assets/animations/processing4.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing5.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing6.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing7.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing8.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing9.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing10.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing11.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing12.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing13.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/processing14.json'),
            SizedBox(height: 10,),
              Lottie.asset('assets/animations/mobile.json'),
            SizedBox(height: 10,),
              Lottie.asset('assets/animations/win.json'),
            SizedBox(height: 10,),
              Lottie.asset('assets/animations/winner.json'),
            SizedBox(height: 10,),
             Lottie.asset('assets/animations/success.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/interview.json'),
            SizedBox(height: 10,),
            Lottie.asset('assets/animations/lock.json'),
            SizedBox(height: 10,),
            

          ],
        ),
      ),
      
    );
  }
}