import 'package:flutter/material.dart';
import '../data/sample_questions.dart';
import 'question_paper_details_page.dart';

class PreviousQuestionsPage extends StatefulWidget {
  const PreviousQuestionsPage({super.key});

  @override
  State<PreviousQuestionsPage> createState() => _PreviousQuestionsPageState();
}

class _PreviousQuestionsPageState extends State<PreviousQuestionsPage> {
  int selectedSemester = 8;
  String? selectedCourse = 'Mobile Computing';
  String selectedSection = '8B';
  String selectedExamType = 'Mid-Term';

  List<String> getCoursesForSemester(int semester) {
    return sampleQuestionPapers
        .where((paper) => paper.semester == semester)
        .map((paper) => paper.courseTitle)
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

  void openQuestionPaper() {
    if (selectedCourse == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const QuestionPaperDetailsPage(
            paper: null,
          ),
        ),
      );
      return;
    }

    final matchedPapers = sampleQuestionPapers.where((paper) {
      return paper.semester == selectedSemester &&
          paper.courseTitle == selectedCourse &&
          paper.section == selectedSection &&
          paper.examType == selectedExamType;
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionPaperDetailsPage(
          paper: matchedPapers.isEmpty ? null : matchedPapers.first,
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
        title: const Text('Previous Questions'),
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
                      Icons.menu_book,
                      size: 55,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Question Archive',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Select semester, course, section and exam type to view archived question papers.',
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
                  selectedCourse = courses.isEmpty ? null : courses.first;

                  selectedSection = '${selectedSemester}A';
                });
              },
            ),

            const SizedBox(height: 14),

            DropdownButtonFormField<String>(
              initialValue: selectedCourse,
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
              initialValue: selectedExamType,
              decoration: const InputDecoration(
                labelText: 'Select Exam Type',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Mid-Term', child: Text('Mid-Term')),
                DropdownMenuItem(value: 'Final', child: Text('Final')),
                DropdownMenuItem(value: 'Quiz', child: Text('Quiz')),
                DropdownMenuItem(value: 'MCQ', child: Text('MCQ')),
                DropdownMenuItem(value: 'Practical', child: Text('Practical')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedExamType = value!;
                });
              },
            ),

            const SizedBox(height: 22),

            ElevatedButton.icon(
              onPressed: openQuestionPaper,
              icon: const Icon(Icons.search),
              label: const Text('View Question Paper'),
            ),
          ],
        ),
      ),
    );
  }
}