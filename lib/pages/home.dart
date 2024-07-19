import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> categoryItem = [
    {
      "categoryName": "AC Service",
      "categoryImage": "assets/download.jpeg",
      "CategoryDescription": "Book a repair"
    },
    {
      "categoryName": "Plumbing",
      "categoryImage": "assets/download.jpeg",
      "CategoryDescription": "Fix your pipes"
    },
    {
      "categoryName": "Plumbing",
      "categoryImage": "assets/download.jpeg",
      "CategoryDescription": "Fix your pipes"
    },
    {
      "categoryName": "Plumbing",
      "categoryImage": "assets/download.jpeg",
      "CategoryDescription": "Fix your pipes"
    },
    {
      "categoryName": "Electrical",
      "categoryImage": "assets/download.jpeg",
      "CategoryDescription": "Get electrical help"
    },
    {
      "categoryName": "Cleaning",
      "categoryImage": "assets/download.jpeg",
      "CategoryDescription": "House cleaning services"
    }
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
                    child: Container(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image that takes full width and maintains aspect ratio
                          SizedBox(
                            width: double.infinity,
                            height: 160, // Fixed height for images to prevent overflow
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
