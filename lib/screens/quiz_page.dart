import 'package:flutter/material.dart';
import '../data/sample_quiz_questions.dart';
import 'quiz_play_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedSemester = 8;
  String selectedSection = '8B';
  String selectedCourse = 'Mobile Computing';
  String selectedDifficulty = 'Easy';

  List<String> getCoursesForSemester(int semester) {
    return sampleQuizQuestions
        .where((quiz) => quiz.semester == semester)
        .map((quiz) => quiz.courseTitle)
        .toSet()
        .toList();
  }

  List<String> getSectionsForSemester(int semester) {
    return [
      '${semester}A',
      '${semester}B',
      '${semester}C',
      '${semester}D',
      '${semester}E',
      '${semester}F',
      '${semester}G',
      '${semester}H',
    ];
  }

  void startQuiz() {
    final filteredQuestions = sampleQuizQuestions.where((quiz) {
      return quiz.semester == selectedSemester &&
          quiz.section == selectedSection &&
          quiz.courseTitle == selectedCourse &&
          quiz.difficulty == selectedDifficulty;
    }).toList();

    if (filteredQuestions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No quiz questions found for selected options'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPlayPage(
          questions: filteredQuestions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final courseOptions = getCoursesForSemester(selectedSemester);
    final sectionOptions = getSectionsForSemester(selectedSemester);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Practice'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Icon(
                      Icons.quiz,
                      size: 55,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Start Practice Quiz',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Choose semester, section, course and difficulty before starting.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            DropdownButtonFormField<int>(
              initialValue: selectedSemester,
              decoration: const InputDecoration(
                labelText: 'Select Semester',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 1, child: Text('1st Semester')),
                DropdownMenuItem(value: 2, child: Text('2nd Semester')),
                DropdownMenuItem(value: 3, child: Text('3rd Semester')),
                DropdownMenuItem(value: 4, child: Text('4th Semester')),
                DropdownMenuItem(value: 5, child: Text('5th Semester')),
                DropdownMenuItem(value: 6, child: Text('6th Semester')),
                DropdownMenuItem(value: 7, child: Text('7th Semester')),
                DropdownMenuItem(value: 8, child: Text('8th Semester')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedSemester = value!;

                  final courses = getCoursesForSemester(selectedSemester);
                  selectedCourse = courses.isEmpty ? '' : courses.first;

                  selectedSection = '${selectedSemester}A';
                });
              },
            ),

            const SizedBox(height: 14),

            DropdownButtonFormField<String>(
              initialValue: selectedSection,
              decoration: const InputDecoration(
                labelText: 'Select Section',
                border: OutlineInputBorder(),
              ),
              items: sectionOptions.map((section) {
                return DropdownMenuItem(
                  value: section,
                  child: Text(section),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSection = value!;
                });
              },
            ),

            const SizedBox(height: 14),

            DropdownButtonFormField<String>(
              initialValue: selectedCourse.isEmpty ? null : selectedCourse,
              decoration: const InputDecoration(
                labelText: 'Select Course',
                border: OutlineInputBorder(),
              ),
              items: courseOptions.map((course) {
                return DropdownMenuItem(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: courseOptions.isEmpty
                  ? null
                  : (value) {
                      setState(() {
                        selectedCourse = value!;
                      });
                    },
            ),

            const SizedBox(height: 14),

            DropdownButtonFormField<String>(
              initialValue: selectedDifficulty,
              decoration: const InputDecoration(
                labelText: 'Select Difficulty',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Easy', child: Text('Easy')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'Hard', child: Text('Hard')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value!;
                });
              },
            ),

            const SizedBox(height: 22),

            ElevatedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}