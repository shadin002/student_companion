class QuizQuestion {
  final int semester;
  final String courseCode;
  final String courseTitle;
  final String section;
  final String topic;
  final String difficulty;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.semester,
    required this.courseCode,
    required this.courseTitle,
    required this.section,
    required this.topic,
    required this.difficulty,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}