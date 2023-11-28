import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController _noteController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();
  bool _isPrivate = false;

  int maxNoteLength = 200; // Set your desired character limit

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle exporting from notes
                // You can add your logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Export from Notes'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _noteController,
              maxLines: 8,
              maxLength: maxNoteLength,
              decoration: InputDecoration(
                labelText: 'Enter your note',
                counterText: '${_noteController.text.length}/$maxNoteLength',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _tagsController,
              decoration: InputDecoration(
                labelText: 'Enter tags (comma-separated)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Private'),
                Switch(
                  value: _isPrivate,
                  onChanged: (value) {
                    setState(() {
                      _isPrivate = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle creating a new note
                // You can add your logic here, e.g., save the note
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
