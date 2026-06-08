import 'package:flutter/material.dart';
import '../data/sample_questions.dart';

class PreviousQuestionsPage extends StatefulWidget {
  const PreviousQuestionsPage({super.key});

  @override
  State<PreviousQuestionsPage> createState() => _PreviousQuestionsPageState();
}

class _PreviousQuestionsPageState extends State<PreviousQuestionsPage> {
  int selectedSemester = 7;

  @override
  Widget build(BuildContext context) {
    final filteredPapers = sampleQuestionPapers.where((paper) {
      return paper.semester == selectedSemester;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Questions'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: DropdownButtonFormField<int>(
              value: selectedSemester,
              decoration: const InputDecoration(
                labelText: 'Select Semester',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 7,
                  child: Text('7th Semester'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedSemester = value!;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredPapers.length,
              itemBuilder: (context, index) {
                final paper = filteredPapers[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${paper.courseCode} - ${paper.courseTitle}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text('Section: ${paper.section}'),
                        Text('Instructor: ${paper.instructorName}'),
                        Text('Exam: ${paper.examType} (${paper.year})'),
                        Text('Total Marks: ${paper.totalMarks}'),
                        Text('Time: ${paper.duration}'),

                        const Divider(height: 25),

                        for (final question in paper.questions) ...[
                          Text(
                            'Question ${question.questionNumber}:',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          for (final subQuestion in question.subQuestions)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                '${subQuestion.label}) ${subQuestion.questionText} [${subQuestion.marks} Marks]',
                              ),
                            ),

                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}