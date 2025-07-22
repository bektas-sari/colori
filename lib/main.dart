import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(ColoriApp());
}

class ColoriApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colori',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema renkleri ve yazı fontu
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
        fontFamily: 'Fredoka', // İleride Google Fonts ekleyeceğiz
      ),
      home: SplashScreen(), // İlk açılan ekran
    );
  }
}
