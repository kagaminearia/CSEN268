import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class SortByTitle extends BookEvent {}

class SortByAuthor extends BookEvent {}
