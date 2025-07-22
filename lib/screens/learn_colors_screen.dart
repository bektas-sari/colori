import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class LearnColorsScreen extends StatefulWidget {
  const LearnColorsScreen({super.key});

  @override
  State<LearnColorsScreen> createState() => _LearnColorsScreenState();
}

class _LearnColorsScreenState extends State<LearnColorsScreen> {
  final AudioPlayer _player = AudioPlayer();

  final List<Map<String, dynamic>> _colors = [
    {'name': 'Kırmızı', 'color': Colors.red, 'audio': 'red.mp3'},
    {'name': 'Sarı', 'color': Colors.yellow, 'audio': 'yellow.mp3'},
    {'name': 'Mavi', 'color': Colors.blue, 'audio': 'blue.mp3'},
    {'name': 'Yeşil', 'color': Colors.green, 'audio': 'green.mp3'},
    {'name': 'Turuncu', 'color': Colors.orange, 'audio': 'orange.mp3'},
    {'name': 'Mor', 'color': Colors.purple, 'audio': 'purple.mp3'},
  ];

  int _currentIndex = 0;

  void _nextColor() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _colors.length;
    });
    _playAudio();
  }

  void _playAudio() async {
    await _player.stop();
    await _player.play(
      AssetSource('sounds/${_colors[_currentIndex]['audio']}'),
    );
  }

  @override
  void initState() {
    super.initState();
    _playAudio();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = _colors[_currentIndex];

    return Scaffold(
      backgroundColor: current['color'].withOpacity(0.2),
      appBar: AppBar(
        title: Text('Renkleri Öğren'),
        backgroundColor: current['color'],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Renkli daire
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: current['color'],
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 30),
            // Renk ismi
            Text(
              current['name'],
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _nextColor,
              style: ElevatedButton.styleFrom(
                backgroundColor: current['color'],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: StadiumBorder(),
              ),
              child: Text(
                'Sonraki Renk',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
