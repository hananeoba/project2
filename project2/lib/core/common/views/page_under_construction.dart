import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/core/common/widgets/gradient_background.dart';
import 'package:project2/core/res/media_res.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        image: MediaRes.onboarding_background,
        child: Lottie.asset(MediaRes.page_under_construction),
      ),
    );
  }
}
