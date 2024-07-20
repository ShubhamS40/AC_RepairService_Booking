import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BookingDetailPage(),
  ));
}

class BookingDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example booking data
    final booking = {
      'bookingId': '123456',
      'userName': 'John Doe',
      'service': 'AC Repair',
      'date': '2024-07-25',
      'time': '15:00',
      'status': 'Confirmed',
      'address': '123 Elm Street, Springfield',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking ID: ${booking['bookingId']}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16),
            _buildDetailRow('Name:', booking['userName']!),
            _buildDetailRow('Service Type:', booking['service']!),
            _buildDetailRow('Date:', booking['date']!),
            _buildDetailRow('Time:', booking['time']!),
            _buildDetailRow('Current Status:', booking['status']!),
            _buildDetailRow('Address:', booking['address']!),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
