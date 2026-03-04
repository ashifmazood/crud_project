import 'package:crud_project/task_adding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 double _opacity=0.0;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100),() {
      if (mounted)setState(() {
        ()=>_opacity=1.0;
      });
    },
    );
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:
      
       Center(
         child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: _opacity,
           child: Column(mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('CRUD',style: TextStyle(
                  fontSize: 40,fontWeight: FontWeight.w700,color: Colors.lightGreenAccent,
                ),),
              )
            ],
                 ),
         ),
       ),
    );
  }
}