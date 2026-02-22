import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_test_project_impl/features/home/data/models/book_suggestion.dart';
import 'package:interview_test_project_impl/features/home/data/repositories/book_search_repository.dart';

part 'book_search_state.dart';

class BookSearchCubit extends Cubit<BookSearchState> {
  final BookSearchRepository bookSearchRepository;
  BookSearchCubit(this.bookSearchRepository) : super(BookSearchInitial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(BookSearchInitial());
      return;
    }

    emit(BookSearchLoading());

    try {
      final results = await bookSearchRepository.searchBooks(query);

      if (results.isEmpty) {
        emit(BookSearchEmpty());
      } else {
        emit(BookSearchLoaded(results));
      }
    } catch (e) {
      emit(BookSearchError());
    }
  }

  void clearSearch() {
    emit(BookSearchInitial());
  }
}
