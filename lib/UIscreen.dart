import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetest/Members.dart';
import 'package:machinetest/memberdetail.dart';
import 'package:machinetest/service/service.dart';
import 'package:machinetest/model/model.dart';

class Uiscreen extends StatefulWidget {
  const Uiscreen({Key? key}) : super(key: key);

  @override
  State<Uiscreen> createState() => _UiscreenState();
}

class _UiscreenState extends State<Uiscreen> {
  int _selectedIndex = 3;
  late Future<List<User>> _futureUsers;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureUsers = _apiService.fetchUsers();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToMemberDetail(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemberDetailPage(
          user: user,
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    EdgeInsets _padding() {
      if (screenWidth > 600) {
        return EdgeInsets.all(32.0);
      } else {
        return EdgeInsets.all(16.0);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: _padding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {},
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
                Text(
                  "Hello Aswathy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 48),
              ],
            ),
            SizedBox(height: 20),
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
              child: FutureBuilder<List<User>>(
                future: _futureUsers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No users found'));
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenWidth > 600 ? 4 : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        User user = snapshot.data![index];
                        return GestureDetector(
                          onTap: () => _navigateToMemberDetail(context, user),
                          child: MemberCard(
                            imagePath: user.photo,
                            name: user.name,
                          ),
                        );
                      },
                    );
                  }
                },
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.explore, 0),
          _buildNavItem(Icons.notifications, 1),
          _buildNavItem(Icons.bookmark, 2),
          _buildNavItem(Icons.person, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Positioned(
              top: -10,
              child: Icon(
                Icons.arrow_drop_down,
                color: CupertinoColors.activeGreen,
                size: 24,
              ),
            ),
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(
              icon,
              color: isSelected ? CupertinoColors.activeGreen : Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}