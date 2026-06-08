class QuestionPaper {
  final int semester;
  final String courseCode;
  final String courseTitle;
  final String section;
  final String instructorName;
  final int year;
  final String examType;
  final int totalMarks;
  final String duration;
  final List<PaperQuestion> questions;

  QuestionPaper({
    required this.semester,
    required this.courseCode,
    required this.courseTitle,
    required this.section,
    required this.instructorName,
    required this.year,
    required this.examType,
    required this.totalMarks,
    required this.duration,
    required this.questions,
  });
}

class PaperQuestion {
  final int questionNumber;
  final List<SubQuestion> subQuestions;

  PaperQuestion({
    required this.questionNumber,
    required this.subQuestions,
  });
}

class SubQuestion {
  final String label;
  final String questionText;
  final int marks;

  SubQuestion({
    required this.label,
    required this.questionText,
    required this.marks,
  });
}