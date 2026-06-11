import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import 'quiz_result_page.dart';

class QuizPlayPage extends StatefulWidget {
  final List<QuizQuestion> questions;

  const QuizPlayPage({
    super.key,
    required this.questions,
  });

  @override
  State<QuizPlayPage> createState() => _QuizPlayPageState();
}

class _QuizPlayPageState extends State<QuizPlayPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;
  bool answerSubmitted = false;

  void submitAnswer(int selectedIndex) {
    if (answerSubmitted) {
      return;
    }

    final currentQuestion = widget.questions[currentQuestionIndex];

    setState(() {
      selectedAnswerIndex = selectedIndex;
      answerSubmitted = true;

      if (selectedIndex == currentQuestion.correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        answerSubmitted = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(
            score: score,
            totalQuestions: widget.questions.length,
          ),
        ),
      );
    }
  }

  Color getOptionColor(int index, QuizQuestion currentQuestion) {
    if (!answerSubmitted) {
      return Colors.white;
    }

    if (index == currentQuestion.correctAnswerIndex) {
      return Colors.green.shade100;
    }

    if (index == selectedAnswerIndex &&
        selectedAnswerIndex != currentQuestion.correctAnswerIndex) {
      return Colors.red.shade100;
    }

    return Colors.white;
  }

  Color getBorderColor(int index, QuizQuestion currentQuestion) {
    if (!answerSubmitted) {
      return Colors.grey.shade400;
    }

    if (index == currentQuestion.correctAnswerIndex) {
      return Colors.green;
    }

    if (index == selectedAnswerIndex &&
        selectedAnswerIndex != currentQuestion.correctAnswerIndex) {
      return Colors.red;
    }

    return Colors.grey.shade400;
  }

  IconData? getOptionIcon(int index, QuizQuestion currentQuestion) {
    if (!answerSubmitted) {
      return null;
    }

    if (index == currentQuestion.correctAnswerIndex) {
      return Icons.check_circle;
    }

    if (index == selectedAnswerIndex &&
        selectedAnswerIndex != currentQuestion.correctAnswerIndex) {
      return Icons.cancel;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / widget.questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Practice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${currentQuestion.courseCode} - ${currentQuestion.courseTitle}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text('Topic: ${currentQuestion.topic}'),
                    Text('Difficulty: ${currentQuestion.difficulty}'),

                    const SizedBox(height: 12),

                    LinearProgressIndicator(value: progress),

                    const SizedBox(height: 8),

                    Text(
                      'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                currentQuestion.questionText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            for (int i = 0; i < currentQuestion.options.length; i++)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: getOptionColor(i, currentQuestion),
                    side: BorderSide(
                      color: getBorderColor(i, currentQuestion),
                      width: 1.5,
                    ),
                    padding: const EdgeInsets.all(14),
                    foregroundColor: const Color.fromARGB(221, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: answerSubmitted
                      ? null
                      : () {
                          submitAnswer(i);
                        },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          currentQuestion.options[i],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      if (getOptionIcon(i, currentQuestion) != null)
                        Icon(
                          getOptionIcon(i, currentQuestion),
                          color: i == currentQuestion.correctAnswerIndex
                              ? Colors.green
                              : Colors.red,
                        ),
                    ],
                  ),
                ),
              ),

            const Spacer(),

            if (answerSubmitted)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: goToNextQuestion,
                  child: Text(
                    currentQuestionIndex == widget.questions.length - 1
                        ? 'Finish Quiz'
                        : 'Next Question',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}