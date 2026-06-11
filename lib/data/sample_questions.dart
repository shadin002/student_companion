import '../models/question.dart';

List<QuestionPaper> sampleQuestionPapers = [
  QuestionPaper(
    semester: 8,
    courseCode: 'CSE4203',
    courseTitle: 'Mobile Computing',
    section: '8B',
    instructorName: 'Md. Riaz Mahmud',
    year: 2026,
    examType: 'Mid-Term',
    totalMarks: 40,
    duration: '2 Hours',
    questions: [
      PaperQuestion(
        questionNumber: 1,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText: 'What is mobile computing?',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Explain the main characteristics of mobile computing.',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Write the differences between mobile computing and traditional computing.',
            marks: 3,
          ),
        ],
      ),
      PaperQuestion(
        questionNumber: 2,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText: 'What is wireless communication?',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Explain the role of wireless networks in mobile computing.',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Mention two advantages and two limitations of mobile computing.',
            marks: 3,
          ),
        ],
      ),
    ],
  ),

  QuestionPaper(
    semester: 8,
    courseCode: 'CSE4205',
    courseTitle: 'Neural Network',
    section: '8B',
    instructorName: 'Faria Afrin Tisha',
    year: 2026,
    examType: 'Mid-Term',
    totalMarks: 40,
    duration: '2 Hours',
    questions: [
      PaperQuestion(
        questionNumber: 1,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText: 'What is an artificial neural network?',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Explain the basic structure of a biological neuron and an artificial neuron.',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Why is activation function used in neural networks?',
            marks: 3,
          ),
        ],
      ),
      PaperQuestion(
        questionNumber: 2,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText: 'What is perceptron?',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Explain the working process of a single layer perceptron.',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Write two limitations of a single layer perceptron.',
            marks: 3,
          ),
        ],
      ),
    ],
  ),

  QuestionPaper(
    semester: 8,
    courseCode: 'CSE4207',
    courseTitle: 'Pattern Recognition',
    section: '8B',
    instructorName: 'Ashik Mahmud Raz',
    year: 2026,
    examType: 'Mid-Term',
    totalMarks: 40,
    duration: '2 Hours',
    questions: [
      PaperQuestion(
        questionNumber: 1,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText: 'What is pattern recognition?',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Explain the basic steps of a pattern recognition system.',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Give two real-life applications of pattern recognition.',
            marks: 3,
          ),
        ],
      ),
      PaperQuestion(
        questionNumber: 2,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText: 'What is feature extraction?',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Why is feature selection important in pattern recognition?',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Write the difference between classification and clustering.',
            marks: 3,
          ),
        ],
      ),
    ],
  ),

  QuestionPaper(
    semester: 7,
    courseCode: 'CSE4101',
    courseTitle: 'Machine Learning',
    section: '7B',
    instructorName: 'Teacher A',
    year: 2025,
    examType: 'Final',
    totalMarks: 60,
    duration: '3 Hours',
    questions: [
      PaperQuestion(
        questionNumber: 1,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText:
                'Explain supervised, unsupervised, and reinforcement learning with examples.',
            marks: 6,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'What is overfitting? How can overfitting be reduced?',
            marks: 6,
          ),
        ],
      ),
      PaperQuestion(
        questionNumber: 2,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText:
                'Explain precision, recall, and F1-score with formula.',
            marks: 6,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Why can accuracy be misleading for imbalanced datasets?',
            marks: 6,
          ),
        ],
      ),
    ],
  ),
];