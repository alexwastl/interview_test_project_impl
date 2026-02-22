import 'package:equatable/equatable.dart';

/// Simple book class that holds information about a book item
class BookSuggestion extends Equatable {
  final String title;
  final List<String> authors;

  const BookSuggestion({required this.title, required this.authors});

  @override
  List<Object?> get props => [title, authors];

  // map json to book suggestion model
  factory BookSuggestion.fromJson(Map<String, dynamic> json) {
    return BookSuggestion(
      title: json['title'],
      authors:
          (json['author_name'] as List?)
              ?.map((item) => item.toString())
              .toList() ??
          [],
    );
  }
}
