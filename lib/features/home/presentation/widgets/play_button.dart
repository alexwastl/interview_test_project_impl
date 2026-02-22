import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';

const iconSize = 50.0;
const buttonRadius = 50.0;

/// Play button in a book cover for the continue section
class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: customPrimaryColor,
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
      // ignore: prefer_const_constructors
      child: Icon(
        Icons.play_arrow_rounded,
        size: iconSize,
        color: Colors.white,
      ),
    );
  }
}
