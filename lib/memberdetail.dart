import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machinetest/model/model.dart';
import 'package:machinetest/UIscreen.dart';

class MemberDetailPage extends StatefulWidget {
  final User user;
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MemberDetailPage({
    required this.user,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _MemberDetailPageState createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.network(
                widget.user.photo,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: Container(
                  height: MediaQuery.of(context).size.height - 250,
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        widget.user.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.activeGreen,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Company: ${widget.user.company}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Username: ${widget.user.username}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email: ${widget.user.email}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Address: ${widget.user.address}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Zip: ${widget.user.zip}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'State: ${widget.user.state}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Country: ${widget.user.country}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Phone: ${widget.user.phone}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: CupertinoColors.activeGreen,
                    size: 17,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
