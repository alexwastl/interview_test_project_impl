import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/features/home/data/models/book.dart';
import 'package:interview_test_project_impl/features/home/presentation/widgets/book_cover_extended.dart';

// Vertically scrollable section of new books
class NewSection extends StatelessWidget {
  const NewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: mockBooks.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final book = mockBooks[index];

        return BookCoverExtended(
          publishDate: book.publishingDate,
          media: book.bookCover,
          title: book.title,
          authors: book.authors,
        );
      },
    );
  }
}
