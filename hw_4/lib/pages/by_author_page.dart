import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_4/bloc/book_bloc.dart';
import 'package:hw_4/bloc/book_state.dart';
import 'package:hw_4/model/book.dart';
import 'package:hw_4/widgets/booklistview.dart';

class ByAuthorPage extends StatelessWidget {
  const ByAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        List<Book> books = [];
        if (state is BooksSortedByAuthor) {
          books = state.books;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "By Author",
                  style: TextStyle(fontSize: 24,),
                ),
              ),
              Expanded(child: BookListView(books: books)),
            ],
          );
        // return BookListView(books: books); 
      },
    );
  }
}
