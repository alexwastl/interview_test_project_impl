import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';
import 'package:interview_test_project_impl/features/home/presentation/widgets/book_search_bar.dart';
import 'package:interview_test_project_impl/features/home/presentation/widgets/continue_section.dart';
import 'package:interview_test_project_impl/features/home/presentation/widgets/new_section.dart';

/// Home screen of the application allowing the user to search and view books
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BookSearchBar(),
            mediumVerticalSpacing,
            const AppText("Continue", size: AppTextSize.headline),
            mediumVerticalSpacing,
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: const ContinueSection(),
            ),
            mediumVerticalSpacing,
            const AppText("New", size: AppTextSize.headline),
            mediumVerticalSpacing,
            const NewSection(),
          ],
        ),
      ),
    );
  }
}
