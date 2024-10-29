import 'package:flutter/material.dart';
import 'package:hw_4/model/book.dart';

class BookInfoView extends StatelessWidget {
  final Book book;
  
  const BookInfoView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              book.imageUrl,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            book.title,
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 8),
          Text(
            book.author,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 16),
          Text(
            book.description,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }


}