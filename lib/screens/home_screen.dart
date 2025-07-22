import 'package:flutter/material.dart';
import 'package:colori/screens/learn_colors_screen.dart';
import 'package:colori/screens/color_quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Colori'ye Hoş Geldin!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                // 🎨 Renkleri Öğren butonu
                ElevatedButton.icon(
                  icon: Icon(Icons.color_lens, size: 28),
                  label: Text(
                    'Renkleri Öğren',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 60),
                    shape: StadiumBorder(),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LearnColorsScreen(),
                      ),
                    );
                  },
                ),

                SizedBox(height: 20),

                // 🧠 Renk Oyunu butonu
                ElevatedButton.icon(
                  icon: Icon(Icons.lightbulb, size: 28),
                  label: Text(
                    'Renk Oyunu',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 60),
                    shape: StadiumBorder(),
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ColorQuizScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
