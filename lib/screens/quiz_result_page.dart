import 'package:flutter/material.dart';

class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  String getResultMessage() {
    final percentage = (score / totalQuestions) * 100;

    if (percentage >= 80) {
      return 'Excellent work!';
    } else if (percentage >= 50) {
      return 'Good try. Keep practicing!';
    } else {
      return 'Needs more practice.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double percentage = (score / totalQuestions) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      size: 80,
                      color: const Color.fromARGB(255, 109, 2, 176), //trophy icon
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Quiz Completed!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      getResultMessage(),
                      style: const TextStyle(fontSize: 16),
                    ),

                    const Divider(height: 35),

                    Text(
                      '$score / $totalQuestions',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Score',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 20),

                    LinearProgressIndicator(
                      value: percentage / 100,
                      minHeight: 10,
                      backgroundColor: Colors.grey.shade300,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '${percentage.toStringAsFixed(1)}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.replay),
              label: const Text('Back to Quiz Menu'),
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.home),
              label: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}