import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Practice'),
      ),
      body: const Center(
        child: Text(
          'Quiz practice will be shown here',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}