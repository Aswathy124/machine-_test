import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  // Path to the image asset
  final String imagePath;

  // Name of the member
  final String name;

  // Constructor for the MemberCard class
  const MemberCard({required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Define the shape of the card with rounded corners
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // Set the elevation (shadow) of the card
      elevation: 4,
      color: Colors.white, // Set the background color to white
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // Space for image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath, // Path to the image asset
                height: 120, // Height of image
                width: double.infinity, // Image width to stretch the card width
                fit: BoxFit.cover, // Cover the entire space
              ),
            ),
          ),
          // Padding around the text
          Padding(
            padding: const EdgeInsets.all(8.0), // Space around the text
            child: Text(
              name, // Member's name
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the text bold
                color: Colors.black, // Set the text color
                fontSize: 15, // Set the font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
