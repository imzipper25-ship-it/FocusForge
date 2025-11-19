import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/mood_cubit.dart';
import '../../data/mood_repository.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoodRepository(),
      child: BlocProvider(
        create: (context) => MoodCubit(
          repository: context.read<MoodRepository>(),
        ),
        child: const MoodView(),
      ),
    );
  }
}

class MoodView extends StatefulWidget {
  const MoodView({super.key});

  @override
  State<MoodView> createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
  int _selectedMood = 3; // 1-5
  double _energyLevel = 5.0; // 1-10
  final _noteController = TextEditingController();

  final List<String> _moodEmojis = ['😢', '😕', '😐', '🙂', '😄'];
  final List<String> _moodLabels = ['Awful', 'Bad', 'Okay', 'Good', 'Great'];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<MoodCubit>().logMood(
          moodRating: _selectedMood,
          energyLevel: _energyLevel.round(),
          note: _noteController.text.trim(),
        );
  }

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
          'Mood Check-in',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<MoodCubit, MoodState>(
        listener: (context, state) {
          if (state is MoodSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Mood logged successfully!'),
                backgroundColor: AppColors.success,
              ),
            );
            Navigator.of(context).pop();
          } else if (state is MoodError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mood Selection
                Text(
                  'How are you feeling?',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    final isSelected = _selectedMood == index + 1;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedMood = index + 1),
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary.withValues(alpha: 0.2)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                              border: isSelected
                                  ? Border.all(color: AppColors.primary, width: 2)
                                  : null,
                            ),
                            child: Text(
                              _moodEmojis[index],
                              style: TextStyle(
                                fontSize: isSelected ? 40 : 32,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _moodLabels[index],
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 48),

                // Energy Level
                Text(
                  'Energy Level: ${_energyLevel.round()}/10',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.secondary,
                    inactiveTrackColor: AppColors.surfaceVariant,
                    thumbColor: AppColors.secondary,
                    overlayColor: AppColors.secondary.withValues(alpha: 0.2),
                    trackHeight: 8,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                  ),
                  child: Slider(
                    value: _energyLevel,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    onChanged: (value) => setState(() => _energyLevel = value),
                  ),
                ),
                const SizedBox(height: 48),

                // Note
                Text(
                  'Add a note (optional)',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _noteController,
                  maxLines: 3,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'What\'s on your mind?',
                    hintStyle: const TextStyle(color: AppColors.textSecondary),
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state is MoodSubmitting ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                      ),
                    ),
                    child: state is MoodSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Log Mood',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
