import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_4/bloc/book_bloc.dart';
import 'package:hw_4/bloc/book_event.dart';
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      BlocProvider.of<BookBloc>(context).add(SortByAuthor());
    } else if (index == 1) {
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
        children: const [
          ByAuthorPage(),
          ByTitlePage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
