import 'package:flutter/material.dart';
import 'package:project2/src/onboarding/presentation/onboarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page,
) {}
