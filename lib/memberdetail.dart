

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetest/UIscreen.dart';

class MemberDetailPage extends StatefulWidget {
  // Path to the member's image
  final String imagePath;

  // Name of the member
  final String name;

  // Currently selected index from the bottom navigation
  final int selectedIndex;

  // Function to handle bottom navigation item taps
  final Function(int) onItemTapped;

  // Constructor for the MemberDetailPage class
  const MemberDetailPage({
    required this.imagePath,
    required this.name,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _MemberDetailPageState createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  // Index of the currently selected bottom navigation item
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    // Initialize the current index, range 0 to 2
    _currentIndex = widget.selectedIndex.clamp(0, 2);
  }

  // handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Call the parent function to handle navigation
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image of the member
          Column(
            children: [
              Image.asset(
                widget.imagePath, // Image path passed from parent
                width: 500,
                height: 500,
                fit: BoxFit.cover, // Cover the entire space
              ),
            ],
          ),
          // Container with member details, positioned below the image
          Positioned(
            top: 400,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.zero,
              child: ClipRRect(
                // Rounded corners for the container
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: Container(
                  height: MediaQuery.of(context).size.height - 250, // Dynamic height based on screen size
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          // Member's name
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.activeGreen, // Color for the name
                            ),
                          ),
                          SizedBox(height: 5),
                          // Member's company
                          Text(
                            'Company: Kurt',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          //  member details
                          Text('Username: Jaeden66', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 10),
                          Text('Email id: Martina_Johns@yahoo.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 10),
                          Text('Address: 76257 Marilyne Keys', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 10),
                          Text('Zip: 99242-9663', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 10),
                          Text('State: South Dakota', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 10),
                          Text('Country: Liberia', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 10),
                          Text('Phone: 636-840-0544', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Back button at the top left corner
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white38,
                  width: 5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white38,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_sharp, color: CupertinoColors.activeGreen, size: 17),
                  onPressed: () {
                    Navigator.pop(context); // Pop the current route and return to the previous screen
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _currentIndex, // Current selected index for the bottom navigation bar
        onItemTapped: _onItemTapped, // Function to handle navigation item taps
      ),
    );
  }
}
