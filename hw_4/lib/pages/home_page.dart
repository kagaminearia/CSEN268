import 'package:flutter/material.dart';
import 'package:hw_4/pages/profile_page.dart';
import 'by_author_page.dart';
import 'by_title_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        backgroundColor: Colors.purple[50],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          ByAuthorPage(),
          ByTitlePage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
