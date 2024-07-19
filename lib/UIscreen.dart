import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetest/Members.dart';
import 'package:machinetest/memberdetail.dart';

class Uiscreen extends StatefulWidget {
  const Uiscreen({Key? key}) : super(key: key);

  @override
  State<Uiscreen> createState() => _UiscreenState();
}

class _UiscreenState extends State<Uiscreen> {
  // Index of the currently selected bottom navigation item
  int _selectedIndex = 3;

  // Method to handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to navigate to the MemberDetailPage
  void _navigateToMemberDetail(BuildContext context, String imagePath, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemberDetailPage(
          imagePath: imagePath,
          name: name,
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding based on screen width
    EdgeInsets _padding() {
      if (screenWidth > 600) {
        return EdgeInsets.all(32.0); // Larger padding for larger screens
      } else {
        return EdgeInsets.all(16.0); // Smaller padding for smaller screens
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: _padding(), // Apply responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button with circular shape
                Material(
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      // Add your onPressed logic here
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: CupertinoColors.activeGreen,
                        size: 17,
                      ),
                    ),
                  ),
                ),
                // Title text
                Text(
                  "Hello Aswathy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 48), // Spacer
              ],
            ),
            SizedBox(height: 20),
            // Main heading text
            Text(
              'Explore the\nBeautiful Members',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: screenWidth > 600 ? 4 : 2, // Responsive grid layout
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  // Member cards with tap gesture to navigate
                  GestureDetector(
                    onTap: () => _navigateToMemberDetail(context, 'assets/img_1.png', 'Jordyn Koelpin'),
                    child: MemberCard(
                      imagePath: 'assets/img_1.png',
                      name: 'Jordyn Koelpin',
                    ),
                  ),
                  GestureDetector(
                    child: MemberCard(
                      imagePath: 'assets/img_13.png',
                      name: 'Amith Arora',
                    ),
                  ),
                  GestureDetector(
                    child: MemberCard(
                      imagePath: 'assets/img_11.png',
                      name: 'Deepak Rajesh',
                    ),
                  ),
                  GestureDetector(
                    child: MemberCard(
                      imagePath: 'assets/img_10.png',
                      name: 'Amith Arora',
                    ),
                  ),
                  GestureDetector(
                    child: MemberCard(
                      imagePath: 'assets/img_8.png',
                      name: 'Deepak Rajesh',
                    ),
                  ),
                  GestureDetector(
                    child: MemberCard(
                      imagePath: 'assets/img_9.png',
                      name: 'Amith Arora',
                    ),
                  ),
                  GestureDetector(
                    child: MemberCard(
                      imagePath: 'assets/img_12.png',
                      name: 'Deepak Rajesh',
                    ),
                  ),
                  GestureDetector(
                    child: MemberCard(
                      imagePath: 'assets/img.png',
                      name: 'Amith Arora',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
//custombottomnavigation starts here...
class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      //icons are added in row manner
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Navigation items
          _buildNavItem(Icons.explore, 0),
          _buildNavItem(Icons.notifications, 1),
          _buildNavItem(Icons.bookmark, 2),
          _buildNavItem(Icons.person, 3),
        ],
      ),
    );
  }

  // Method to build each navigation item
  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Drop-down icon for selected item
          if (isSelected)
            Positioned(
              top: -10, // position of the drop-down icon
              child: Icon(
                Icons.arrow_drop_down,
                color: CupertinoColors.activeGreen,
                size: 24, // Drop-down icon size
              ),
            ),
          // Main navigation icon
          Container(
            padding: EdgeInsets.all(8), // Adjusting padding for the icon
            child: Icon(
              icon,
              color: isSelected ? CupertinoColors.activeGreen : Colors.grey,
              size: 24, // Icon size
            ),
          ),
        ],
      ),
    );
  }
}
