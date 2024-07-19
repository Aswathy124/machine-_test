import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const MemberCard({required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red),
                        Text('Image not found', style: TextStyle(color: Colors.red)),
                        SizedBox(height: 8),
                        Text('URL: $imagePath'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
