import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../logic/home_cubit.dart';
import '../widgets/focus_score_card.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/daily_stats_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..loadDashboard(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.greeting('Alex'), // TODO: Get user name
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            l10n.greetingSubtitle,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.surfaceVariant,
                        child: const Icon(Icons.person, color: AppColors.textPrimary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Focus Score
                  FocusScoreCard(score: state.focusScore),
                  const SizedBox(height: 24),

                  // Quick Actions
                  QuickActionsWidget(
                    onStartFocus: () {
                      // TODO: Navigate to Focus Timer
                    },
                    onLogMood: () {
                      // TODO: Open Mood Logger
                    },
                    onAiCoach: () {
                      // TODO: Open AI Chat
                    },
                  ),
                  const SizedBox(height: 24),

                  // Daily Stats
                  Text(
                    l10n.dailySummary,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  DailyStatsWidget(
                    focusMinutes: state.focusMinutes,
                    tasksCompleted: state.tasksCompleted,
                    energyLevel: state.energyLevel,
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
