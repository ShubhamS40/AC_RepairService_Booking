import 'package:flutter/material.dart';
import 'package:khatushyam/component/humburger.dart';
import 'package:khatushyam/screen/booking.dart';
import 'dart:async'; // For Timer

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> categoryItem = [
    {
      "categoryName": "AC Service",
      "serviceCharge": "400",
      "categoryImage": "assets/acservice.jpg",
      "CategoryDescription": "Book a repair"
    },
    {
      "categoryName": "AC Installation",
      "serviceCharge": "1500",
      "categoryImage": "assets/acinstallation.jpg",
      "CategoryDescription": "Fix your pipes"
    },
    {
      "categoryName": "AC Pour Gas",
      "serviceCharge": "2200",
      "categoryImage": "assets/acgascharge.jpg",
      "CategoryDescription": "Fix your pipes"
    },
    {
      "categoryName": "AC Checking",
      "serviceCharge": "200",
      "categoryImage": "assets/acchecking.jpg",
      "CategoryDescription": "Fix your pipes"
    },
  ];

  List<Map<String, String>> reviews = [
    {
      "userName": "Alice",
      "review": "Excellent service! The technician was on time and very professional.",
      "rating": "5"
    },
    {
      "userName": "Bob",
      "review": "Good service, but the technician was a bit late.",
      "rating": "4"
    },
    {
      "userName": "Charlie",
      "review": "Average experience. The issue was resolved but took longer than expected.",
      "rating": "3"
    },
  ];

  List<String> advertisementImages = [
    'https://static.toiimg.com/thumb/msid-98147246,width-1280,height-720,resizemode-4/98147246.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8g6pTK1YPhGvOS4RwB1IKV79Z_47gFdxoAQ&s',
    'https://via.placeholder.com/600x300.png?text=Ad+3',
  ];

  late PageController _pageController;
  int _currentPage = 0;
  final Duration _slideDuration = Duration(seconds: 2);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(_slideDuration, (timer) {
      if (_currentPage < advertisementImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: _slideDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("AC Services"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications), // Bell icon
            onPressed: () {
              // Add action for the bell icon here
              print('Bell icon pressed');
            },
          ),
          SizedBox(width: 20), // Optional: Add spacing between icons
        ],
      ),
      drawer: DrawerDirectory(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/download.jpeg", width: 50, height: 50),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, User", style: textTheme.headlineSmall),
                    Text("How can we help you today?", style: textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          // Advertisement Slider
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            height: 150.0, // Reduced height of the slider
            child: PageView.builder(
              controller: _pageController,
              itemCount: advertisementImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      advertisementImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          // Wrapping GridView in Expanded to fill remaining space
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select a Service',
                        style: textTheme.headlineLarge,
                      ),
                      SizedBox(height: 10),
                      // GridView inside a Container with a fixed height
                      Container(
                        height: MediaQuery.of(context).size.height / 1.5, // Adjusted height of the grid view
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 2 / 3, // Adjusted child aspect ratio
                          ),
                          itemCount: categoryItem.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = categoryItem[index];
                            return Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(12),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookingScreen(
                                        categoryName: item["categoryName"]!,
                                        serviceCharges: item["serviceCharge"]!,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue.shade100, Colors.blue.shade300],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Image that takes full width and maintains aspect ratio
                                      ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        child: SizedBox(
                                          width: 500,
                                          height: 160, // Adjusted height for images
                                          child: Image.asset(
                                            item["categoryImage"]!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item["categoryName"]!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          item["CategoryDescription"]!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customer Reviews",
                        style: textTheme.headlineLarge,
                      ),
                      SizedBox(height: 10),
                      ...reviews.map((review) => _buildReviewCard(review)).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Map<String, String> review) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review['userName']!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              review['review']!,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text(
                  review['rating']!,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
