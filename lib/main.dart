import 'package:flutter/material.dart';
import 'quizpageannifa.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz 1',
      theme: ThemeData(fontFamily: 'Geist'),
      home: Quiz1Page(),
    );
  }
}
