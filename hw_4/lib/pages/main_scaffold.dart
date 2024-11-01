import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_4/bloc/book_bloc.dart';
import 'package:hw_4/bloc/book_event.dart';
import 'package:hw_4/pages/by_author_page.dart';
import 'package:hw_4/pages/by_title_page.dart';
import 'package:hw_4/pages/profile_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ByAuthorPage(),
    const ByTitlePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      // Dispatch SortByAuthor event when "By Author" is selected
      BlocProvider.of<BookBloc>(context).add(SortByAuthor());
    } else if (index == 1) {
      // Dispatch SortByTitle event when "By Title" is selected
      BlocProvider.of<BookBloc>(context).add(SortByTitle());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        backgroundColor: Colors.purple[50],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'By Author'),
          BottomNavigationBarItem(icon: Icon(Icons.title), label: 'By Title'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
