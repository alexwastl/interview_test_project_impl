import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';

const bottomNavIconSize = 26.0;

/// Custom nav bar with an extended currently selected nav bar item
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // lock to home for now
  final currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(0, Icons.home_outlined, "Home"),
            _buildNavItem(1, Icons.layers_outlined, "Books"),
            _buildNavItem(2, Icons.explore_outlined, "Search"),
            _buildNavItem(3, Icons.person_outline, "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String labelText) {
    final bool isSelected = currentIndex == index;
    final theme = Theme.of(context);
    final primaryColor = Theme.of(context).brightness == Brightness.light
        ? theme.primaryColor
        : theme.colorScheme.onSurface;

    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8.0),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, size: bottomNavIconSize, color: primaryColor),
            if (isSelected) ...[
              smallHorizontalSpacing,
              AppText(
                labelText,
                color: primaryColor,
                size: AppTextSize.headline,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
