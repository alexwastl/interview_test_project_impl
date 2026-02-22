import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';
import 'package:interview_test_project_impl/features/home/logic/cubit/book_search_cubit.dart';

const debounceTimerDurationInMs = 350;

/// Search bar for books using a [BookSearchCubit]
class BookSearchBar extends StatefulWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();
}

class _BookSearchBarState extends State<BookSearchBar> {
  final SearchController _searchController = SearchController();

  String _lastValue = "";
  // Inside your State class:
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      final currentValue = _searchController.text;
      final query = _searchController.text;
      // Clear search
      if (currentValue.isEmpty && _lastValue.isNotEmpty) {
        context.read<BookSearchCubit>().clearSearch();
        _debounce?.cancel();
      }
      // Trigger search
      if (query.isNotEmpty && query.length >= 3) {
        // 2. Start a new 350ms timer
        _debounce = Timer(
          const Duration(milliseconds: debounceTimerDurationInMs),
          () {
            if (query.isNotEmpty) {
              context.read<BookSearchCubit>().search(query);
            }
          },
        );
      }
      _lastValue = currentValue; // Update for the next change
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel(); // clean up timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      searchController: _searchController,
      builder: (BuildContext context, SearchController controller) {
        // Flutter search bar
        return SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return [
          BlocBuilder<BookSearchCubit, BookSearchState>(
            builder: (context, state) {
              if (state is BookSearchLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is BookSearchLoaded) {
                return Column(
                  children: state.bookSuggestions.map((book) {
                    return ListTile(
                      leading: Image.asset(
                        "assets/image_covers/cover_new_1.jpg",
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                      title: AppText(book.title, size: AppTextSize.medium),
                      subtitle: AppText(
                        book.authors.isEmpty ? "Unknown" : book.authors.first,
                        size: AppTextSize.label,
                      ),
                      onTap: () {
                        // close view on tap
                        controller.closeView(book.title);
                      },
                    );
                  }).toList(),
                );
              }

              if (state is BookSearchError) {
                return const ListTile(
                  title: AppText(
                    'Something did not work, please try again',
                    size: AppTextSize.medium,
                  ),
                );
              }

              if (state is BookSearchEmpty) {
                return const ListTile(
                  title: AppText(
                    'Unfortunately, there is no book for your search in our catalogue',
                    size: AppTextSize.medium,
                  ),
                );
              }

              return const ListTile(
                title: AppText(
                  "Type to search for books. Please provide at least three characters to start the search",
                  size: AppTextSize.medium,
                ),
              );
            },
          ),
        ];
      },
    );
  }
}
