import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: UserProfilePage(),
  ));
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/acservice.jpg'), // Replace with your image asset
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 24),
            _buildInfoRow('Phone Number', '+1234567890'),
            SizedBox(height: 16),
            _buildInfoRow('Email', '@gnail.vocm'),
            SizedBox(height: 16),

            _buildInfoRow('House No', '123 '),
            SizedBox(height: 16),
            _buildInfoRow('Street no ', ' Springfield'),
            SizedBox(height: 16),
            _buildInfoRow('Apartment Name', 'Golden Apartment'),
            SizedBox(height: 16),
            _buildInfoRow('Landmark', 'XYZ Univertsity'),
            SizedBox(height: 16),
            _buildInfoRow('City', 'Delhi'),
            SizedBox(height: 16),
            _buildInfoRow('State', 'Delhi'),
            SizedBox(height: 16),
            _buildInfoRow('Pin Code', '110040'),
            SizedBox(height: 16),


          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
