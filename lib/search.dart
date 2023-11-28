import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  // Dummy data for notes (replace this with your actual data)
  List<String> notes = [
    'Note 1 - #flutter',
    'Note 2 - #dart',
    'Note 3 - #flutter, #mobile',
    // Add more notes with different tags
  ];

  List<String> filteredNotes = [];

  void searchNotes() {
    String searchTerm = _searchController.text.toLowerCase();
    filteredNotes = notes
        .where((note) => note.toLowerCase().contains(searchTerm))
        .toList();
    setState(() {});
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                searchNotes();
              },
              decoration: InputDecoration(
                labelText: 'Search Notes by Tag',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchNotes();
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredNotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.grey[900], // Background color of the card
                    child: ListTile(
                      title: Text(
                        filteredNotes[index],
                        style: TextStyle(color: Colors.white), // Text color
                      ),
                      // Add more details or customize ListTile as needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
