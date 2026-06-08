import '../models/question.dart';

List<QuestionPaper> sampleQuestionPapers = [
  QuestionPaper(
    semester: 7,
    courseCode: 'CSE4101',
    courseTitle: 'Machine Learning',
    section: '7B',
    instructorName: 'Teacher A',
    year: 2025,
    examType: 'Mid-Term',
    totalMarks: 40,
    duration: '2 Hours',
    questions: [
      PaperQuestion(
        questionNumber: 1,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText:
                'Explain the primary differences between supervised, unsupervised, and reinforcement learning with one real-world example for each.',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'Prove that the ordinary least squares cost function for linear regression is convex. Why is convexity important for gradient descent?',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Suppose your linear regression model has high bias. Would you add more training data or add more features to improve it? Justify your choice.',
            marks: 3,
          ),
        ],
      ),
      PaperQuestion(
        questionNumber: 2,
        subQuestions: [
          SubQuestion(
            label: 'a',
            questionText:
                'Explain why accuracy can be a misleading metric when dealing with a highly imbalanced dataset.',
            marks: 3,
          ),
          SubQuestion(
            label: 'b',
            questionText:
                'A model predicting a rare medical disease has TP = 10, FP = 20, FN = 5, TN = 965. Calculate Precision, Recall, and F1-Score.',
            marks: 4,
          ),
          SubQuestion(
            label: 'c',
            questionText:
                'Describe how Logistic Regression uses the sigmoid function to map predictions into probabilities between 0 and 1.',
            marks: 3,
          ),
        ],
      ),
    ],
  ),
];