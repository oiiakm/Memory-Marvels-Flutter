import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_marvels/score.dart';
import '../home.dart';

class Level4 extends StatefulWidget {
  const Level4({Key? key}) : super(key: key);

  @override
  State<Level4> createState() => _Level4State();
}

class _Level4State extends State<Level4> {
  List<String> images = [
    "assets/thor.png",
    "assets/spiderman.png",
    "assets/hulk.png",
    "assets/ironman.png",
    "assets/captainamerica.png",
    "assets/wanda.png",
    "assets/groot.png",
    "assets/racoon.png",
    "assets/panther.png",
    "assets/scarlett.png",
    "assets/scorpion.png",
    "assets/cyborg.png",
    "assets/drstrange.png",
    "assets/thanos.png",
  ];

  List<Color> tileColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.brown,
    Colors.pink
  ];

  List<String> cards = [];
  List<bool> isVisible = [];
  List<int> selectedCards = [];
  int score = 0;

  void setupCards() {
    for (int i = 0; i < images.length; i++) {
      cards.add(images[i]);
      cards.add(images[i]);
      isVisible.add(false);
      isVisible.add(false);
    }

    cards.shuffle();
  }

  void selectCard(int index) {
    if (selectedCards.length == 2) {
      return;
    }

    setState(() {
      isVisible[index] = true;
      selectedCards.add(index);
    });

    if (selectedCards.length == 2) {
      if (cards[selectedCards[0]] == cards[selectedCards[1]]) {
        Timer(const Duration(milliseconds: 500), () {
          setState(() {
            isVisible[selectedCards[0]] = true;
            isVisible[selectedCards[1]] = true;
            selectedCards.clear();
            score += 10;
          });
        });
      } else {
        Timer(const Duration(milliseconds: 500), () {
          setState(() {
            isVisible[selectedCards[0]] = false;
            isVisible[selectedCards[1]] = false;
            selectedCards.clear();
          });
        });
      }
    }
  }

  int remainingSeconds = 60;

  @override
  void initState() {
    super.initState();
    setupCards();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingSeconds--;
        if (remainingSeconds == 0) {
          timer.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScoreCardPage(score: score),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 140, 204, 170),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Time left: $remainingSeconds seconds",
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Your Score: $score",
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (isVisible[index] || selectedCards.length == 2) {
                        return;
                      }

                      selectCard(index);

                      if (isVisible[index]) {
                        return;
                      }

                      setState(() {
                        isVisible[index] = true;
                      });
                    },
                    child: Card(
                      elevation: 4.0,
                      color: (!isVisible[index])
                          ? tileColors[Random().nextInt(tileColors.length)]
                          : null,
                      child: Center(
                        child: (isVisible[index])
                            ? AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  cards[index],
                                  fit: BoxFit.contain,
                                ),
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                remainingSeconds = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              icon: const Icon(Icons.home),
              label: const Text("Home"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
