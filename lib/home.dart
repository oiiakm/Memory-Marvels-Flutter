import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'game/level1.dart';
import 'game/level2.dart';
import 'game/level3.dart';
import 'game/level4.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Welcome Back Marvel!',
                      textAlign: TextAlign.center,
                      speed: const Duration(seconds: 1),
                      textStyle: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Level1()),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Easy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Level2()),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        'Medium',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Level3()),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Hard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Level4()),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.purple,
                    child: Center(
                      child: Text(
                        'Pro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
