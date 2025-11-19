import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/onboarding_cubit.dart';
import '../widgets/onboarding_steps.dart';
import '../../../home/presentation/pages/home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) => previous.currentPage != current.currentPage,
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      builder: (context, state) {
        final isLastPage = state.currentPage == 3; // 0, 1, 2, 3
        final canProceed = _canProceed(state);

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // Progress Bar
                LinearProgressIndicator(
                  value: (state.currentPage + 1) / 4,
                  backgroundColor: AppColors.surfaceVariant,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.teal),
                ),
                
                // Back Button (if not first page)
                if (state.currentPage > 0)
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => context.read<OnboardingCubit>().previousPage(),
                    ),
                  )
                else
                  const SizedBox(height: 48),

                // Page Content
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(), // Disable swipe
                    children: const [
                      RoleStep(),
                      HoursStep(),
                      PainStep(),
                      BurnoutStep(),
                    ],
                  ),
                ),

                // Bottom Navigation
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: canProceed
                          ? () {
                              if (isLastPage) {
                                context.read<OnboardingCubit>().completeOnboarding();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()),
                                );
                              } else {
                                context.read<OnboardingCubit>().nextPage();
                              }
                            }
                          : null,
                      child: state.isSubmitting
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(isLastPage ? l10n.getStarted : l10n.continueButton),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _canProceed(OnboardingState state) {
    switch (state.currentPage) {
      case 0:
        return state.selectedRole != null;
      case 1:
        return state.dailyHours != null;
      case 2:
        return state.mainPainPoint != null;
      case 3:
        return state.burnoutLevel != null;
      default:
        return false;
    }
  }
}
