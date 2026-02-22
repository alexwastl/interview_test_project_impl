import 'package:equatable/equatable.dart';

/// Simple book class that holds information about a book item
class Book extends Equatable {
  final String title;
  final List<String> authors;
  final DateTime publishingDate;
  final String bookCover;

  const Book({
    required this.title,
    required this.authors,
    required this.publishingDate,
    required this.bookCover,
  });

  @override
  List<Object?> get props => [title, authors, publishingDate];
}

// mocked list of book content for the app
final mockBooks = [
  Book(
    title: "Feel Good",
    authors: const ["Ali Abdaal"],
    publishingDate: DateTime(2025, 12, 12),
    bookCover: "assets/image_covers/cover_new_1.jpg",
  ),
  Book(
    title: "Make Time",
    authors: const ["Jake Knapp", "John Zeratsky"],
    publishingDate: DateTime(2018, 12, 1),
    bookCover: "assets/image_covers/cover_new_2.jpg",
  ),
  Book(
    title: "Keep Going",
    authors: const ["Austin Kleon"],
    publishingDate: DateTime(2017, 12, 5),
    bookCover: "assets/image_covers/cover_new_3.jpg",
  ),
  Book(
    title: "Think like a Monk",
    authors: const ["Jay Shetty"],
    publishingDate: DateTime(2019, 12, 4),
    bookCover: "assets/image_covers/cover_new_4.jpg",
  ),
];
