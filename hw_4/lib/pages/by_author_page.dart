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
        } else if (state is BookLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookError) {
          return const Center(child: Text("Failed to load books"));
        }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "By Author",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Expanded(
                  child: books.isNotEmpty
                      ? BookListView(books: books)
                      : const Center(child: Text("No books available")),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
