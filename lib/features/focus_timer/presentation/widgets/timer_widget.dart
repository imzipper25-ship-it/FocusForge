import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TimerWidget extends StatelessWidget {
  final int remainingSeconds;
  final double progress;

  const TimerWidget({
    super.key,
    required this.remainingSeconds,
    required this.progress,
  });

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remaining = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remaining.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background Circle
        SizedBox(
          width: 280,
          height: 280,
          child: CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 12,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.surfaceVariant.withValues(alpha: 0.3),
            ),
          ),
        ),
        // Progress Circle
        SizedBox(
          width: 280,
          height: 280,
          child: CircularProgressIndicator(
            value: 1.0 - progress, // Invert so it empties
            strokeWidth: 12,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            strokeCap: StrokeCap.round,
          ),
        ),
        // Time Text
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _formatTime(remainingSeconds),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    fontFeatures: [const FontFeature.tabularFigures()],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'FOCUS',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    letterSpacing: 4,
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
