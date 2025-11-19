import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/focus_timer_cubit.dart';
import '../widgets/timer_widget.dart';

class FocusTimerPage extends StatelessWidget {
  const FocusTimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FocusTimerCubit(),
      child: const FocusTimerView(),
    );
  }
}

class FocusTimerView extends StatelessWidget {
  const FocusTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Focus Session',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<FocusTimerCubit, FocusTimerState>(
        listener: (context, state) {
          if (state.status == TimerStatus.completed) {
            // Show completion dialog or notification
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Session Complete!'),
                content: const Text('Great job! You stayed focused.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                      Navigator.of(context).pop(); // Go back to home
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimerWidget(
                  remainingSeconds: state.remaining,
                  progress: state.progress,
                ),
                const SizedBox(height: 64),
                
                // Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.status == TimerStatus.initial)
                      _buildControlButton(
                        context,
                        icon: Icons.play_arrow,
                        label: 'Start',
                        color: AppColors.primary,
                        onTap: () => context.read<FocusTimerCubit>().startTimer(),
                      ),
                      
                    if (state.status == TimerStatus.running) ...[
                      _buildControlButton(
                        context,
                        icon: Icons.pause,
                        label: 'Pause',
                        color: AppColors.secondary,
                        onTap: () => context.read<FocusTimerCubit>().pauseTimer(),
                      ),
                      const SizedBox(width: 24),
                      _buildControlButton(
                        context,
                        icon: Icons.stop,
                        label: 'Give Up',
                        color: AppColors.error,
                        onTap: () => context.read<FocusTimerCubit>().stopTimer(),
                      ),
                    ],

                    if (state.status == TimerStatus.paused) ...[
                      _buildControlButton(
                        context,
                        icon: Icons.play_arrow,
                        label: 'Resume',
                        color: AppColors.primary,
                        onTap: () => context.read<FocusTimerCubit>().resumeTimer(),
                      ),
                      const SizedBox(width: 24),
                      _buildControlButton(
                        context,
                        icon: Icons.stop,
                        label: 'Stop',
                        color: AppColors.error,
                        onTap: () => context.read<FocusTimerCubit>().stopTimer(),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildControlButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Material(
          color: color.withValues(alpha: 0.1),
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Icon(icon, color: color, size: 32),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }
}
