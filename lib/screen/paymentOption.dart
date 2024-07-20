import 'package:flutter/material.dart';
import 'package:khatushyam/constant/textTheme.dart';

void main() {
  runApp(MaterialApp(
    home: PaymentMethodPage(),
  ));
}

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String _selectedPaymentMethod = 'Credit Card';

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentMethodChips(),
            SizedBox(height: 20),
            if (_selectedPaymentMethod == 'Credit Card') _buildCreditCardFields(),
            SizedBox(height: 20),
            CustomButton(
              name: "Pay now",
              onPressed: () {
                // Handle payment submission
                print('Payment Method: $_selectedPaymentMethod');
                print('Card Number: ${_cardNumberController.text}');
                print('Expiry Date: ${_expiryDateController.text}');
                print('CVV: ${_cvvController.text}');
              },

            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodChips() {
    final paymentMethods = [
      {'label': 'Credit Card', 'icon': Icons.credit_card},
      {'label': 'PayPal', 'icon': Icons.account_balance_wallet},
      {'label': 'Net Banking', 'icon': Icons.account_balance},
      {'label': 'Razorpay', 'icon': Icons.payment},
    ];

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: paymentMethods.map((method) {
        final label = method['label'] as String;
        final icon = method['icon'] as IconData;
        final isSelected = _selectedPaymentMethod == label;

        return ChoiceChip(
          label: Row(
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.black),
              SizedBox(width: 8.0),
              Text(
                label,
                style: TextStyle(color: isSelected ? Colors.white : Colors.black),
              ),
            ],
          ),
          selected: isSelected,
          selectedColor: Colors.blue,
          onSelected: (selected) {
            setState(() {
              _selectedPaymentMethod = label;
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildCreditCardFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _cardNumberController,
          decoration: InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (MM/YY)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _cvvController,
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
