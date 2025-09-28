import 'package:flutter/material.dart';
import 'package:xo_game/core/app_colors.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.blue, AppColors.cyan],
                begin: Alignment.bottomCenter)),
        child: child);
  }
}
