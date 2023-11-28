import 'package:flutter/material.dart';
import 'homepage.dart';
import 'create.dart';
import 'profile.dart';
import 'search.dart';
import 'firstpage.dart'; 
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();
  

  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      
      home: LoginRegisterScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Define your screens here
  final List<Widget> _screens = [
    Home(),
    Search(),
    Create(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.amber,),
            label: '', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.amber, ),
            label: '', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.amber,),
            label: '', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.amber,),
            label: '',
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomePage(),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SearchPage(),
    );
  }
}

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CreatePage(),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProfilePage(),
    );
  }
}
