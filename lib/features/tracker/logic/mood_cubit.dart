import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/mood_repository.dart';

// --- State ---
abstract class MoodState extends Equatable {
  const MoodState();

  @override
  List<Object?> get props => [];
}

class MoodInitial extends MoodState {}

class MoodSubmitting extends MoodState {}

class MoodSuccess extends MoodState {}

class MoodError extends MoodState {
  final String message;

  const MoodError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Cubit ---
class MoodCubit extends Cubit<MoodState> {
  final MoodRepository _repository;

  MoodCubit({required MoodRepository repository})
      : _repository = repository,
        super(MoodInitial());

  Future<void> logMood({
    required int moodRating,
    required int energyLevel,
    String? note,
  }) async {
    emit(MoodSubmitting());
    try {
      await _repository.logMood(
        moodRating: moodRating,
        energyLevel: energyLevel,
        note: note,
      );
      emit(MoodSuccess());
    } catch (e) {
      emit(MoodError('Failed to log mood: ${e.toString()}'));
    }
  }
}
