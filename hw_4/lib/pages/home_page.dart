import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_4/bloc/book_bloc.dart';
import 'package:hw_4/bloc/book_event.dart';
import 'package:hw_4/pages/profile_page.dart';
import 'by_author_page.dart';
import 'by_title_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      BlocProvider.of<BookBloc>(context).add(SortByAuthor());
    } else if (index == 1) {
      BlocProvider.of<BookBloc>(context).add(SortByTitle());
    }
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Books"),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu), // Menu icon on the left
          onPressed: () {
            // Implement your menu action here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_outlined), // Profile icon on the right
            onPressed: () {
              // Implement your profile action here
            },
          ),
        ],
        backgroundColor: Colors.purple[50], // Set the background color of the AppBar
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          ByAuthorPage(),
          ByTitlePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'By Author'),
          BottomNavigationBarItem(icon: Icon(Icons.title), label: 'By Title'),
          BottomNavigationBarItem(icon: Icon(Icons.build_circle_sharp), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}