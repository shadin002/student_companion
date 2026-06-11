import 'package:flutter/material.dart';
import '../data/sample_notices.dart';
import 'notice_details_page.dart';

class NoticesPage extends StatelessWidget {
  const NoticesPage({super.key});

  void openNotice(BuildContext context, notice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoticeDetailsPage(
          notice: notice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notices'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleNotices.length,
        itemBuilder: (context, index) {
          final notice = sampleNotices[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              title: Text(
                notice.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Date: ${notice.date}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                openNotice(context, notice);
              },
            ),
          );
        },
      ),
    );
  }
}