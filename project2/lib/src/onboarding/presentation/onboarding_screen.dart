import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/common/widgets/gradient_background.dart';
import 'package:project2/core/res/colors.dart';
import 'package:project2/core/res/media_res.dart';
import 'package:project2/src/onboarding/domain/entities/page_content.dart';
import 'package:project2/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:project2/src/onboarding/presentation/views/loading_view.dart';
import 'package:project2/src/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<OnboardingCubit>().isFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GradientBackground(
        image: MediaRes.onboarding_background,
        child: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (state is OnBoardingStatus && !state.isFirstTime) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is UserCached) {
              // TODO(user-cached-handler): Navigate to appropreate screen.
            }
          },
          builder: (context, state) {
            if (state is CheckingIsFirstTimer || state is CachingFirstTimer) {
              return const LoadingView();
            }
            return GradientBackground(
              image: MediaRes.onboarding_background,
              child: Stack(
                children: [
                  PageView(
                    children: [
                      const OnboardingBody(
                        pageContent: PageContent.first(),
                      ),
                      const OnboardingBody(
                        pageContent: PageContent.second(),
                      ),
                      const OnboardingBody(
                        pageContent: PageContent.third(),
                      ),
                      Align(
                        alignment: const Alignment(0, 0.04),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          onDotClicked: (index) {
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          effect: const WormEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotColor: Colours.primaryColor,
                            dotColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
