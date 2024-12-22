import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/src/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
        if (state is OnBoardingStatus) {
          Navigator.pushReplacementNamed(context, '/home');
        }
        // TODO: implement listener
      }, builder: (context, state) {
        if (state is CheckingIsFirstTimer) {}
        return const Center();
      }),
    );
  }
}
