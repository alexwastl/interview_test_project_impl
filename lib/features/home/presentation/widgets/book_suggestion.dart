import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';

import 'package:interview_test_project_impl/features/home/data/models/book.dart';

/// A book suggestion shown in after a successful book search
class BookSuggestion extends StatelessWidget {
  const BookSuggestion({super.key, required this.book});

  final Book book; // TODO: Use book suggestion from state

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Book title
        AppText(
          book.title,
          overflow: TextOverflow.ellipsis,
          size: AppTextSize.headline,
        ),
        AppText(book.title, size: AppTextSize.label, color: Colors.grey[600]),
        // First book author
      ],
    );
  }
}
