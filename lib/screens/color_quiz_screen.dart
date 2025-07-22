import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

class ColorQuizScreen extends StatefulWidget {
  const ColorQuizScreen({super.key});

  @override
  State<ColorQuizScreen> createState() => _ColorQuizScreenState();
}

class _ColorQuizScreenState extends State<ColorQuizScreen> {
  final AudioPlayer _player = AudioPlayer();

  final List<Map<String, dynamic>> _colorOptions = [
    {'name': 'Kırmızı', 'color': Colors.red, 'audio': 'red.mp3'},
    {'name': 'Sarı', 'color': Colors.yellow, 'audio': 'yellow.mp3'},
    {'name': 'Mavi', 'color': Colors.blue, 'audio': 'blue.mp3'},
    {'name': 'Yeşil', 'color': Colors.green, 'audio': 'green.mp3'},
    {'name': 'Turuncu', 'color': Colors.orange, 'audio': 'orange.mp3'},
    {'name': 'Mor', 'color': Colors.purple, 'audio': 'purple.mp3'},
  ];

  late Map<String, dynamic> _correctAnswer;
  late List<Map<String, dynamic>> _options;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    final random = Random();
    _colorOptions.shuffle();

    // 1. Doğru cevabı rastgele seç
    _correctAnswer = _colorOptions[random.nextInt(_colorOptions.length)];

    // 2. Doğru cevabı dışarıda bırakarak yanlış seçenekleri seç
    final wrongOptions = _colorOptions
        .where((item) => item['name'] != _correctAnswer['name'])
        .toList()
      ..shuffle();

    // 3. Doğru cevabı da listeye ekleyip karıştır
    _options = [...wrongOptions.take(3), _correctAnswer];
    _options.shuffle();

    _playQuestion();
  }

  void _playQuestion() async {
    await _player.stop();
    await _player.play(AssetSource('sounds/${_correctAnswer['audio']}'));
  }

  void _checkAnswer(Map<String, dynamic> selected) async {
    bool isCorrect = selected['name'] == _correctAnswer['name'];

    if (isCorrect) {
      await _player.stop();
      await _player.play(AssetSource('sounds/correct.mp3'));

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("🎉 Bravo!"),
          content: Text("Doğru cevap!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _generateQuestion();
                });
              },
              child: Text("Devam Et"),
            ),
          ],
        ),
      );
    } else {
      await _player.stop();
      await _player.play(AssetSource('sounds/wrong.mp3'));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bu doğru değil, tekrar dene!'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Renk Oyunu"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              "Hangi renk: ${_correctAnswer['name']}?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: _options.map((option) {
                  return GestureDetector(
                    onTap: () => _checkAnswer(option),
                    child: Container(
                      decoration: BoxDecoration(
                        color: option['color'],
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
