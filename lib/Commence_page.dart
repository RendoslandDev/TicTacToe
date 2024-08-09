// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_field, avoid_unnecessary_containers

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictacgame/home_page.dart';

class CommencePage extends StatelessWidget {
  const CommencePage({super.key});

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Text(
              "TIC TAC TOE",
              style: myNewFontWhite,
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: AvatarGlow(
                    duration: Duration(seconds: 500),
                    glowColor: Colors.white,
                    repeat: true,
                    // repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.none),
                          shape: BoxShape.rectangle),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 88.0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            'lib/images/code9.jpg',
                            // color: Colors.white,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    )),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              child: Text(
                "@CREATEDBYRENDOSLAND",
                style: myNewFontWhite,
              ),
            ),
          )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(30),
                  child: Center(
                      child: Text(
                    "PLAY GAME",
                    style: myNewFont,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
