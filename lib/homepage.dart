import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample data for public notes (replace with your actual data)
  List<String> publicNotes = [
    'Public Note 1',
    'Public Note 2',
    'Public Note 3',
    'Public Note 4',
    'Public Note 5',
    // Add more public notes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Welcome message
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  'Welcome to the Home Page!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            // Public notes section
            _buildPublicNotesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPublicNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Public Notes',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: publicNotes.length,
          itemBuilder: (context, index) {
            return _buildPublicNoteCard(publicNotes[index]);
          },
        ),
      ],
    );
  }

  Widget _buildPublicNoteCard(String note) {
    // Define a list of background colors for the cards
    List<Color> cardColors = [
      Colors.grey[800]!, // Dark grey
      Colors.grey[700]!, // Grey
      Colors.grey[600]!, // Light grey
      Colors.black,      // Black
    ];

    // Pick a random color for each card
    Color cardColor = cardColors[DateTime.now().millisecondsSinceEpoch % cardColors.length];

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add any additional note details or customization here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              note,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}