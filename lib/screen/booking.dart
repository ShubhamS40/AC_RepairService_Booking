import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:khatushyam/constant/textTheme.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({required this.serviceCharges, required this.categoryName, Key? key}) : super(key: key);

  final String serviceCharges;
  final String categoryName;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  double _quantity = 0.0;

  double get _subtotal => _quantity * double.parse(widget.serviceCharges);
  double get _total => _subtotal; // You can add more calculations for total if needed

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Booking Date",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.categoryName}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),

              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add Ac Unit", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 150,
                      child: InputQty(
                        maxVal: 10.0,
                        initVal: 0.0,
                        minVal: 0.0,
                        steps: 1,
                        onQtyChanged: (val) {
                          setState(() {
                            _quantity = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Per Unit",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Service Charge",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.serviceCharges}", // Show service charges as formatted text
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),

              Container(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black45),
                  ),
                  Text(
                    "${_subtotal.toStringAsFixed(2)}", // Show subtotal as formatted text
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black45),
                  ),
                  Text(
                    "${_total.toStringAsFixed(2)}", // Show total as formatted text
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Match the container's border radius
                  child: Image.asset(
                    "assets/acgascharge.jpg",
                    fit: BoxFit.cover, // Use BoxFit.cover for better aspect ratio handling
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Set a Date", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: _selectDate,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text(
                            "${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Set a Time", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: _selectTime,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text(
                            "${_selectedTime.format(context)}",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Center(
                child: CustomButton(
                  name: "Book Now",
                  onPressed: () {
                    // Add booking logic here
                    print("Booking Confirmed");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
