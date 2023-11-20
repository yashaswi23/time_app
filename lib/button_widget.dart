import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int timeLeft = 30;
  String start = 'start';
  String s1 = 'Time to Eat Mindfully';
  String s2 = "It's simple: eat slowly for 10 minutes, rest for five, then finish your meal";
  bool isSwitched = true;
  String sound = 'Sound On';
  final player = AudioPlayer();

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
          start = 'pause';
          s1 = 'Nom Nom :)';
          s2 = 'You have 10 minutes to eat before the pasue. Focus on eating slowly';
          if(timeLeft < 5 && timeLeft > 0){
            player.play(AssetSource('countdown_tick.mp3'));
          }
          
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindful Meal timer'),
        leading: Icon(Icons.arrow_back),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // buildTime(),
            Column(
              children: [
                Text(
                  s1,
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                Text(
                  s2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  timeLeft.toString(),
                  style: TextStyle(
                    fontSize: 80,
                  ),
                ),
              ),
            ),

            Container(
              height: 50,
              width: 50,
              child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    if(value == true){
                      sound = sound;
                    } else if(value == false){
                      sound = 'Sound Off';
                    }

                  });
                },
              ),
            ),
            Text(sound, style: TextStyle(fontSize: 30,),),

            MaterialButton(
              height: 40,
              minWidth: 70,
              onPressed: 
                _startCountdown
              ,
              color: Colors.purple,
              child: Text(
                start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),


            // MaterialButton(
            //   height: 40,
            //   minWidth: 70,
            //   // visualDensity: VisualDensity(horizontal: h, vertical: v,),
            //   onPressed: _startCountdown,
            //   color: Colors.green,
            //   child: Text(
            //     "Let's stop, IM full now",
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),

            // buildButtons(),
          ],
        ),
      ),
    );
  }
}


// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
