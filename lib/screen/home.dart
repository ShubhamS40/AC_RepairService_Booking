import 'package:flutter/material.dart';
import 'package:khatushyam/screen/booking.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> categoryItem = [
    {
      "categoryName": "AC Service",
      "serviceCharge":"400",
      "categoryImage": "assets/acservice.jpg",
      "CategoryDescription": "Book a repair"
    },
    {
      "categoryName": "AC Installation",
      "serviceCharge":"1500",
      "categoryImage": "assets/acinstallation.jpg",
      "CategoryDescription": "Fix your pipes"
    },
    {
      "categoryName": "AC Pour   Gas",
      "serviceCharge":"2200",
      "categoryImage": "assets/acgascharge.jpg",
      "CategoryDescription": "Fix your pipes"
    },
    {
      "categoryName": "AC Checking",
      "serviceCharge":"200",
      "categoryImage": "assets/acchecking.jpg",
      "CategoryDescription": "Fix your pipes"
    },




  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset("assets/download.jpeg", width: 80, height: 80),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello, User", style: textTheme.headlineLarge),
                    Text("How can we help you today?", style: textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
          // Wrapping GridView in Expanded to fill remaining space
          Expanded(
            child: Container(

              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: categoryItem.length,
                itemBuilder: (context, index) {
                  final item = categoryItem[index];
                  return Material(
                    elevation: 10,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingScreen(categoryName: item["categoryName"]!,serviceCharges: item["serviceCharge"]!)));
                        },
                        child: Container(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image that takes full width and maintains aspect ratio
                              SizedBox(
                                width: double.infinity,
                                height: 120, // Fixed height for images to prevent overflow
                                child: Image.asset(
                                  item["categoryImage"]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  item["categoryName"]!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(item["CategoryDescription"]!),
                              ),
                            ],
                          ),
                        ),
                      ),

                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
