import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'game.dart';

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
                      speed: const Duration(seconds: 3),
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
                      MaterialPageRoute(builder: (context) => const GamePage()),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Play Now',
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
                  onTap: () {},
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        'Coming Soon...',
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
                  onTap: () {},
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Coming Soon...',
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
                  onTap: () {},
                  child: const Card(
                    margin: EdgeInsets.all(16.0),
                    color: Colors.purple,
                    child: Center(
                      child: Text(
                        'Coming Soon...',
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
