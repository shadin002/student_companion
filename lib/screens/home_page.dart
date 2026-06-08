import 'package:flutter/material.dart';
import 'previous_questions_page.dart';
import 'quiz_page.dart';
import 'notices_page.dart';
import 'portals_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Companion')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Academic Companion for University Students',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreviousQuestionsPage(),
                  ),
                );
              },
              child: const Text('Previous Questions'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
              child: const Text('Quiz Practice'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoticesPage()),
                );
              },
              child: const Text('Notices'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PortalsPage()),
                );
              },
              child: const Text('University Portals'),
            ),
          ],
        ),
      ),
    );
  }
}
