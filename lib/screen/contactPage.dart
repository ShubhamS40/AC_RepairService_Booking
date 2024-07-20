import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this package to handle phone links

void main() {
  runApp(MaterialApp(
    home: ContactPage(),
  ));
}

class ContactPage extends StatelessWidget {
  // Function to launch phone dialer with the provided phone number
  void _launchPhone(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Technicians'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildTechnicianDetail(
                  'assets/tech1.jpg', // Replace with your image asset
                  'John Doe',
                  '+1234567890',
                ),
                SizedBox(height: 16),
                _buildTechnicianDetail(
                  'assets/tech2.jpg', // Replace with your image asset
                  'Jane Smith',
                  '+0987654321',
                ),
                SizedBox(height: 16),
                _buildTechnicianDetail(
                  'assets/tech3.jpg', // Replace with your image asset
                  'Michael Johnson',
                  '+1122334455',
                ),
                // Add more technicians as needed
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.blueAccent,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.support, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text(
                    'Customer Support: +1800123456', // Replace with your support number
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnicianDetail(String imageUrl, String name, String phoneNumber) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 30,
            ),
            title: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text(phoneNumber, style: TextStyle(fontSize: 16)),
          ),
          ButtonBar(
            children: [
              TextButton.icon(
                icon: Icon(Icons.phone, color: Colors.blue),
                label: Text('Call'),
                onPressed: () => _launchPhone(phoneNumber),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
