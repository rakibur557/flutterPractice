import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:insta/pages/firstpage.dart';
import 'package:insta/pages/fourthpage.dart';
import 'package:insta/pages/homepage.dart';
import 'package:insta/pages/secondpage.dart';
import 'package:insta/pages/thirdpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'images/instalogo.png',
        ),
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: MyBottomNavBar(),
      ),
    );
  }
}

//Bottom Navigation Bar Section

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _currentIndex = 0;
  List<Widget> _children = [
    HomePage(),
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage(),
  ];

  void SelectedIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
        ),
        currentIndex: _currentIndex,
        onTap: SelectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library_outlined,
            ),
            label: 'Video',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_outline_rounded,
            ),
            label: 'Shop',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'Profile',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
    //Scaffold Ends
  }
}
