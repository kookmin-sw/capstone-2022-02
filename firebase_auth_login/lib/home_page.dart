import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'maps.dart';
import 'config.dart';

class HomePage extends StatefulWidget {
  const HomePage ({Key ? key}): super (key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int idx = 0;
  List pages = [Home(), Chat(), Maps(), Config()];

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[idx],
      ),
      bottomNavigationBar: BottomNavigationBar (
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        onTap: _onItemTab,
        currentIndex: idx,
        selectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Config'
          ),
        ],
      ),
    );
  }

  void _onItemTab (int index) {
    setState(() {
      idx = index;
    });
  }
}

