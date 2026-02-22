import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';
import 'package:interview_test_project_impl/features/home/data/models/book.dart';
import 'package:interview_test_project_impl/features/home/presentation/widgets/book_cover_round.dart';

// Horizontally scrollable section of books
class ContinueSection extends StatelessWidget {
  const ContinueSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => smallHorizontalSpacing,
      scrollDirection: Axis.horizontal,
      itemCount: mockBooks.length,
      itemBuilder: (context, index) {
        final book = mockBooks[index];

        return BookCoverRound(
          media: book.bookCover,
          title: book.title,
          authors: book.authors,
        );
      },
    );
  }
}
