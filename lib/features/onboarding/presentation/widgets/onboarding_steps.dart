import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/onboarding_cubit.dart';

// --- Base Step Widget ---
class OnboardingStepBase extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget content;

  const OnboardingStepBase({
    super.key,
    required this.title,
    this.subtitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
          const SizedBox(height: 32),
          Expanded(child: content),
        ],
      ),
    );
  }
}

// --- Selection Card ---
class SelectionCard extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.title,
    this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.teal.withValues(alpha: 0.2) : AppColors.surface,
          border: Border.all(
            color: isSelected ? AppColors.teal : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: isSelected ? AppColors.teal : AppColors.textSecondary,
                size: 24,
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.teal,
              ),
          ],
        ),
      ),
    );
  }
}

// --- Step 1: Role Selection ---
class RoleStep extends StatelessWidget {
  const RoleStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return OnboardingStepBase(
          title: l10n.onboardingRole,
          content: ListView(
            children: [
              SelectionCard(
                title: l10n.roleFreelancer,
                icon: Icons.laptop_mac,
                isSelected: state.selectedRole == 'freelancer',
                onTap: () => context.read<OnboardingCubit>().setRole('freelancer'),
              ),
              SelectionCard(
                title: l10n.roleRemoteWorker,
                icon: Icons.home_work,
                isSelected: state.selectedRole == 'remote_worker',
                onTap: () => context.read<OnboardingCubit>().setRole('remote_worker'),
              ),
              SelectionCard(
                title: l10n.roleManager,
                icon: Icons.manage_accounts,
                isSelected: state.selectedRole == 'manager',
                onTap: () => context.read<OnboardingCubit>().setRole('manager'),
              ),
              SelectionCard(
                title: l10n.roleStudent,
                icon: Icons.school,
                isSelected: state.selectedRole == 'student',
                onTap: () => context.read<OnboardingCubit>().setRole('student'),
              ),
            ],
          ),
        );
      },
    );
  }
}

// --- Step 2: Daily Hours ---
class HoursStep extends StatelessWidget {
  const HoursStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return OnboardingStepBase(
          title: l10n.onboardingHours,
          content: ListView(
            children: [
              SelectionCard(
                title: l10n.hours4to6,
                isSelected: state.dailyHours == '4-6',
                onTap: () => context.read<OnboardingCubit>().setDailyHours('4-6'),
              ),
              SelectionCard(
                title: l10n.hours6to8,
                isSelected: state.dailyHours == '6-8',
                onTap: () => context.read<OnboardingCubit>().setDailyHours('6-8'),
              ),
              SelectionCard(
                title: l10n.hours8to10,
                isSelected: state.dailyHours == '8-10',
                onTap: () => context.read<OnboardingCubit>().setDailyHours('8-10'),
              ),
              SelectionCard(
                title: l10n.hoursMore10,
                isSelected: state.dailyHours == '10+',
                onTap: () => context.read<OnboardingCubit>().setDailyHours('10+'),
              ),
            ],
          ),
        );
      },
    );
  }
}

// --- Step 3: Main Pain Point ---
class PainStep extends StatelessWidget {
  const PainStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return OnboardingStepBase(
          title: l10n.onboardingPain,
          content: ListView(
            children: [
              SelectionCard(
                title: l10n.painBurnout,
                icon: Icons.battery_alert,
                isSelected: state.mainPainPoint == 'burnout',
                onTap: () => context.read<OnboardingCubit>().setMainPainPoint('burnout'),
              ),
              SelectionCard(
                title: l10n.painProcrastination,
                icon: Icons.timer_off,
                isSelected: state.mainPainPoint == 'procrastination',
                onTap: () => context.read<OnboardingCubit>().setMainPainPoint('procrastination'),
              ),
              SelectionCard(
                title: l10n.painAnxiety,
                icon: Icons.psychology,
                isSelected: state.mainPainPoint == 'anxiety',
                onTap: () => context.read<OnboardingCubit>().setMainPainPoint('anxiety'),
              ),
              SelectionCard(
                title: l10n.painEnergyLoss,
                icon: Icons.battery_0_bar,
                isSelected: state.mainPainPoint == 'energy_loss',
                onTap: () => context.read<OnboardingCubit>().setMainPainPoint('energy_loss'),
              ),
              SelectionCard(
                title: l10n.painAdhd,
                icon: Icons.bolt,
                isSelected: state.mainPainPoint == 'adhd',
                onTap: () => context.read<OnboardingCubit>().setMainPainPoint('adhd'),
              ),
            ],
          ),
        );
      },
    );
  }
}

// --- Step 4: Burnout Level ---
class BurnoutStep extends StatelessWidget {
  const BurnoutStep({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final level = state.burnoutLevel ?? 5;
        
        Color getColor(int value) {
          if (value <= 3) return AppColors.success;
          if (value <= 7) return AppColors.warning;
          return AppColors.error;
        }

        return OnboardingStepBase(
          title: l10n.onboardingBurnoutLevel,
          subtitle: '1 = Feeling Great, 10 = Total Burnout',
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                level.toString(),
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: getColor(level),
                ),
              ),
              const SizedBox(height: 32),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: getColor(level),
                  thumbColor: getColor(level),
                  overlayColor: getColor(level).withValues(alpha: 0.2),
                  trackHeight: 8,
                ),
                child: Slider(
                  value: level.toDouble(),
                  min: 1,
                  max: 10,
                  divisions: 9,
                  onChanged: (value) {
                    context.read<OnboardingCubit>().setBurnoutLevel(value.toInt());
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.burnoutLevelLow, style: const TextStyle(color: AppColors.success)),
                  Text(l10n.burnoutLevelHigh, style: const TextStyle(color: AppColors.error)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
