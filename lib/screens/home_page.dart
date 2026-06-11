import 'package:flutter/material.dart';
import 'previous_questions_page.dart';
import 'quiz_page.dart';
import 'notices_page.dart';
import 'portals_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Companion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.school,
              size: 70,
              color: Theme.of(context).primaryColor,
            ),

            const SizedBox(height: 12),

            const Text(
              'Academic Companion',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Previous questions, quiz practice, notices and official portals in one place.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 30),

            HomeMenuButton(
              icon: Icons.menu_book,
              title: 'Previous Questions',
              subtitle: 'Browse archived question papers',
              onTap: () {
                openPage(context, const PreviousQuestionsPage());
              },
            ),

            HomeMenuButton(
              icon: Icons.quiz,
              title: 'Quiz Practice',
              subtitle: 'Practice topic-based MCQ questions',
              onTap: () {
                openPage(context, const QuizPage());
              },
            ),

            HomeMenuButton(
              icon: Icons.notifications,
              title: 'Notices',
              subtitle: 'View academic updates and reminders',
              onTap: () {
                openPage(context, const NoticesPage());
              },
            ),

            HomeMenuButton(
              icon: Icons.link,
              title: 'University Portals',
              subtitle: 'Access important official links',
              onTap: () {
                openPage(context, const PortalsPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const HomeMenuButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          size: 32,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}