part of 'book_search_cubit.dart';

abstract class BookSearchState extends Equatable {
  const BookSearchState();

  @override
  List<Object> get props => [];
}

class BookSearchInitial extends BookSearchState {}

class BookSearchLoading extends BookSearchState {}

class BookSearchEmpty extends BookSearchState {}

class BookSearchLoaded extends BookSearchState {
  final List<BookSuggestion> bookSuggestions;
  const BookSearchLoaded(this.bookSuggestions);
}

class BookSearchError extends BookSearchState {}
