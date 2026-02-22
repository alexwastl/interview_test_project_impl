import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http show Client;
import 'package:interview_test_project_impl/common/theme/theme.dart';
import 'package:interview_test_project_impl/common/widgets/bottom_nav_bar.dart';
import 'package:interview_test_project_impl/features/home/data/remote/book_search_impl.dart';
import 'package:interview_test_project_impl/features/home/data/repositories/book_search_repository.dart';
import 'package:interview_test_project_impl/features/home/logic/cubit/book_search_cubit.dart';
import 'package:interview_test_project_impl/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final BookSearchRepository bookSearchRepository = BookSearchImpl(
      client: http.Client(),
    );

    return RepositoryProvider(
      create: (context) => bookSearchRepository,
      child: BlocProvider(
        create: (context) => BookSearchCubit(bookSearchRepository),
        child: MaterialApp(
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: ThemeMode.system, // switch theme from system setting
          home: const Scaffold(
            body: SafeArea(child: HomeScreen()),
            bottomNavigationBar: CustomBottomNavBar(),
          ),
        ),
      ),
    );
  }
}
