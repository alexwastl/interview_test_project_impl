import 'package:interview_test_project_impl/features/home/data/models/book_suggestion.dart';

abstract class BookSearchRepository {
  Future<List<BookSuggestion>> searchBooks(String query);
}
