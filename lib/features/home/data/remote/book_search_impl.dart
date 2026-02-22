import 'dart:convert';

import 'package:interview_test_project_impl/features/home/data/models/book_suggestion.dart';
import 'package:interview_test_project_impl/features/home/data/repositories/book_search_repository.dart';
import 'package:http/http.dart' as http;

// Api implementation, fetching books from remote source openlibrary.org
class BookSearchImpl implements BookSearchRepository {
  final http.Client client;

  BookSearchImpl({required this.client});

  @override
  Future<List<BookSuggestion>> searchBooks(String query) async {
    final Uri url = Uri.parse(
      'https://openlibrary.org/search.json?q=${Uri.encodeComponent(query)}&fields=title,author_name&limit=10',
    );

    try {
      final response = await client.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List<dynamic> docs = decodedData['docs'] as List;

        return docs.map<BookSuggestion>((bookJson) {
          return BookSuggestion.fromJson(bookJson as Map<String, dynamic>);
        }).toList();
      } else {
        throw Exception('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      // In a real app, you'd throw a custom Failure or Exception class here
      throw Exception('Network Error: $e');
    }
  }
}
