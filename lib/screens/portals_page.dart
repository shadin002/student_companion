import 'package:flutter/material.dart';

class PortalsPage extends StatelessWidget {
  const PortalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Portals'),
      ),
      body: const Center(
        child: Text(
          'Official university portal links will be shown here',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}