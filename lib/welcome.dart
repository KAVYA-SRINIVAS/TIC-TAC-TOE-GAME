import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/home_page.dart';
import 'package:tictactoe/homes_page.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: AssetImage('assets/images/img2.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 150),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "TIC",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aladin(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 70),
                    ),
                    Text(
                      "TAC",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aladin(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 70),
                    ),
                    Text(
                      "TOE",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aladin(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 70),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        margin: EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/comp.jpg',
                              height: 75,
                            ),
                            Text("COMPUTER",
                                style: GoogleFonts.aladin(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        margin: EdgeInsets.all(25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/person.png',
                              height: 75,
                            ),
                            Text("FRIENDS",
                                style: GoogleFonts.aladin(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomesPage()));
                      },
                    ),
                  ],
                ),
              ),
              FloatingActionButton(
                onPressed: () => exit(0),
                backgroundColor: Colors.white,
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    Text("EXIT",
                        style: GoogleFonts.aladin(
                            color: Colors.black, fontSize: 13.0))
                  ],
                ),
              ),
              SizedBox(
                height: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
