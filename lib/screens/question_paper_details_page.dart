import 'package:flutter/material.dart';
import '../models/question.dart';

class QuestionPaperDetailsPage extends StatelessWidget {
  final QuestionPaper? paper;

  const QuestionPaperDetailsPage({
    super.key,
    required this.paper,
  });

  @override
  Widget build(BuildContext context) {
    if (paper == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Question Paper'),
        ),
        body: const Center(
          child: Text(
            'No question paper found for selected filters',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Paper'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${paper!.courseCode} - ${paper!.courseTitle}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text('Semester: ${paper!.semester}th Semester'),
                  Text('Section: ${paper!.section}'),
                  Text('Instructor: ${paper!.instructorName}'),
                  Text('Exam: ${paper!.examType} (${paper!.year})'),
                  Text('Total Marks: ${paper!.totalMarks}'),
                  Text('Time: ${paper!.duration}'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          for (final question in paper!.questions)
            Card(
              margin: const EdgeInsets.only(bottom: 14),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${question.questionNumber}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Divider(height: 24),

                    for (final subQuestion in question.subQuestions)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          '${subQuestion.label}) ${subQuestion.questionText} [${subQuestion.marks} Marks]',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}