import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10), // Adjust the preferred height as needed
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // User details section
          _buildUserDetails(),

          // Divider between sections
          Divider(height: 30, color: Colors.grey),

          // Notes made by the user section
          _buildNotesSection('Notes Made by You', [
            'Your Note 1',
            'Your Note 2',
            // Add more notes as needed
          ]),

          // Divider between sections
          Divider(height: 30, color: Colors.grey),

          // Notes saved by the user section
          _buildNotesSection('Notes Saved by You', [
            'Saved Note 1',
            'Saved Note 2',
            // Add more saved notes as needed
          ]),
        ],
      ),
    );
  }

  Widget _buildUserDetails() {
    // Replace the placeholder values with actual user data
    String profilePicUrl = 'https://example.com/profile-pic.jpg';
    String displayName = 'John Doe';
    String username = '@johndoe';
    String bio = 'A passionate note-taker and explorer of ideas.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(profilePicUrl),
        ),
        SizedBox(height: 16.0),
        Text(
          displayName,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        Text(username, style: TextStyle(fontSize: 18.0, color: Colors.grey)),
        SizedBox(height: 8.0),
        Text(bio, style: TextStyle(fontSize: 16.0)),
      ],
    );
  }

  Widget _buildNotesSection(String title, List<String> notes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        if (notes.isEmpty)
          Text('No notes available.')
        else
          Column(
            children: notes
                .map((note) => Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      color: Colors.grey[900], // Background color of the card
                      child: ListTile(
                        title: Text(
                          note,
                          style: TextStyle(color: Colors.white), // Text color
                        ),
                        // Add more details or customize ListTile as needed
                      ),
                    ))
                .toList(),
          ),
      ],
    );
  }
}
