import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';
import 'package:intl/intl.dart';

const double bookCoverWidth = 150;
const double notificationIconSize = 20.0;

/// Round book cover used in the continue section
class BookCoverExtended extends StatelessWidget {
  const BookCoverExtended({
    super.key,
    required this.media,
    required this.title,
    required this.authors,
    required this.publishDate,
  });

  final String media;
  final String title;
  final List<String> authors;
  final DateTime publishDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        // Book cover
        SizedBox(
          width: bookCoverWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(media),
          ),
        ),
        mediumHorizontalSpacing,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                size: AppTextSize.medium,
                overflow: TextOverflow.ellipsis,
                weight: FontWeight.w600,
              ),
              AppText(
                authors.first,
                size: AppTextSize.label,
                color: Colors.grey[600],
              ),

              mediumVerticalSpacing,
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined),
                  smallHorizontalSpacing,
                  AppText(
                    DateFormat('dd MMM yyyy').format(publishDate),
                    size: AppTextSize.label,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Notification icon
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_outlined,
              size: notificationIconSize,
              color: customPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
