import 'package:flutter/material.dart';
import 'package:khatushyam/screen//home.dart';
import 'package:khatushyam/screen/bookingDetail.dart';
import 'package:khatushyam/screen/contactPage.dart';
import 'package:khatushyam/screen/profilePage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<Widget> _pages = [
    HomePage(),
    BookingDetailPage(),
    ContactPage(),
    UserProfilePage()
  ];
  int _selectedIndex = 0; // Track the selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Booking Detail',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Customer Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NavigationPage(),
  ));
}
