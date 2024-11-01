import 'package:flutter/material.dart';
import 'package:hw_4/model/book.dart';
import 'package:hw_4/pages/book_detail_page.dart';

class BookListView extends StatelessWidget {
  final List<Book> books;

  const BookListView({required this.books, super.key});

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailPage(book: book),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0), // Space between items
            padding: const EdgeInsets.all(12.0), // Padding inside the container
            decoration: BoxDecoration(
              color: Colors.purple[50], // Background color for the entire title-author block
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  book.author,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

}
