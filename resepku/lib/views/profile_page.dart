import 'package:flutter/material.dart';
import 'package:resepku/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The container with the profile information and border
            Container(
              padding: EdgeInsets.all(16), // Padding inside the container
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, width: 2), // Border for the container
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for profile picture and username
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30, // Adjust the size of the profile picture
                        backgroundImage: NetworkImage(
                          'https://www.example.com/your-profile-picture.jpg', // Replace with actual image URL
                        ),
                      ),
                      SizedBox(width: 65), // Space between image and text
                      Text(
                        "Nasywa $username",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Row for followers and following count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [Text("Pengikut"), Text("120")],
                      ),
                      Column(
                        children: [Text("Mengikuti"), Text("80")],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // The text "Resep Favorit" outside the rectangle
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align to start
              children: [
                // First Rectangle: Resep Favorit
                Container(
                  width: 160, // Fixed width for the first rectangle
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors
                            .black), // Outline border for the first rectangle
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Resep Favorit:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10), // Space between label and value
                      Text(
                        "2", // Count of favorite recipes
                        style: TextStyle(
                            fontSize: 16, color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),

                // Add space between the rectangles
                SizedBox(width: 10),

                // Second Rectangle: Resep yang dibagikan
                Container(
                  width: 160, // Fixed width for the second rectangle
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors
                            .black), // Outline border for the second rectangle
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Resep yang dibagikan:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10), // Space between label and value
                      Text(
                        "2", // Count of shared recipes
                        style: TextStyle(
                            fontSize: 16, color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Add the Logout Button here
            SizedBox(height: 20), // Space before the button
            ElevatedButton(
              onPressed: () {
                // Implement logout logic here
                // For example, navigate to the login page or clear session data
                // print('Logged out');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                // primary: Colors.red, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
