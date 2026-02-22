import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/features/home/data/models/book.dart';
import 'package:interview_test_project_impl/features/home/presentation/widgets/book_suggestion.dart';

/// Search bar for books
class BookSearchBar extends StatefulWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();
}

class _BookSearchBarState extends State<BookSearchBar> {
  final SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      searchController: searchController,
      builder: (BuildContext context, SearchController controller) {
        return IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            controller.openView();
          },
        );
      },
      // TODO: Link suggestions builder to state
      // State: BookSearchInitial, BookSearchSuccess, BookSearchEmpty, BookSearchError
      // Model: BookSearchSuggestion
      // Apply threshold of 350ms after new search
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<BookSuggestion>.generate(2, (int index) {
          return BookSuggestion(book: mockBooks[index]);
        });
      },
    );
  }
}
