import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';
import 'package:interview_test_project_impl/features/home/presentation/widgets/play_button.dart';

const bookCoverWidth = 150.0;
const imageRadius = 100.0;

/// Round book cover used in the continue section
class BookCoverRound extends StatelessWidget {
  const BookCoverRound({
    super.key,
    required this.media,
    required this.title,
    required this.authors,
  });

  final String media;
  final String title;
  final List<String> authors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bookCoverWidth, // width for each book card
      child: Column(
        children: [
          // Book cover
          Expanded(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: imageRadius,
                  backgroundImage: AssetImage(media),
                ),
                const Positioned(right: 10, bottom: 0, child: PlayButton()),
              ],
            ),
          ),
          smallVerticalSpacing,
          // Book title
          AppText(
            title,
            size: AppTextSize.headline,
            overflow: TextOverflow.ellipsis,
          ),
          // First book author
          AppText(
            authors.first,
            size: AppTextSize.label,
            overflow: TextOverflow.ellipsis,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
