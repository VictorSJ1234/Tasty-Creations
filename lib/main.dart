import 'package:flutter/material.dart';

import 'main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            color: Color(0xff62B34C),
          ),


          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.04),

                    Image.asset(
                      'assets/logo/tasty_logo.png',
                      width: constraints.maxHeight * 0.50,
                      height: constraints.maxHeight * 0.50,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainMenu(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontFamily: "WorkSans",
                            fontSize: constraints.maxHeight * 0.04,
                            fontWeight: FontWeight.w500,
                              color: Color(0xff62B34C),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

    );
  }
}
//mosquinator hello123123