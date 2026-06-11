import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/sample_portals.dart';

class PortalsPage extends StatelessWidget {
  const PortalsPage({super.key});

  Future<void> openPortalLink(String url) async {
    final Uri link = Uri.parse(url);

    if (!await launchUrl(
      link,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not open $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Portals'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: samplePortals.length,
        itemBuilder: (context, index) {
          final portal = samplePortals[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.link,
                  color: Colors.white,
                ),
              ),
              title: Text(
                portal.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(portal.description),
              trailing: const Icon(Icons.open_in_new),
              onTap: () {
                openPortalLink(portal.url);
              },
            ),
          );
        },
      ),
    );
  }
}