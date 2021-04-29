import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tictactoe/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Welcome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/images/img2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        margin: EdgeInsets.all(15.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80.0,
                            child: Center(
                                child: Image(
                              image: AssetImage('assets/images/appicon.png'),
                              height: 110.0,
                              width: 110.0,
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 125.0, left: 125.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                          minHeight: 5.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10.0))
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
