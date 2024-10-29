import 'dart:convert';

class Book {
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });
  

  Book copyWith({
    String? title,
    String? author,
    String? description,
    String? imageUrl,
  }) {
    return Book(
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] as String,
      author: map['author'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(title: $title, author: $author, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.author == author &&
      other.description == description &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      description.hashCode ^
      imageUrl.hashCode;
  }
}
