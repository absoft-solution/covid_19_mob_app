import 'dart:async';

import 'package:covid_19_mob_app/view/word_states_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller=AnimationController(
  duration: Duration(seconds: 3),
      vsync: this)..repeat();
  
  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to WordStatesScreen after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WordStatesScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
AnimatedBuilder(animation: _controller,
    child: Center(
      child: Container(
        height: 200,
        width: 200,
        child: const Image(image: AssetImage("assets/images/virus.png")),
      ),
    ),builder: (BuildContext context, Widget?child){
  return Transform.rotate(angle: _controller.value *2.0 * math.pi ,child: child);
}),
          SizedBox(height:  MediaQuery.of(context).size.height *.08,),
           Text(
           "Covid 19\nTracking App",style: TextStyle(fontSize: 40),textAlign: TextAlign.center,),
        ],
      )),
    );
  }
}
