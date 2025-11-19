import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// --- State ---
class HomeState extends Equatable {
  final int focusScore;
  final int energyLevel;
  final int tasksCompleted;
  final int focusMinutes;
  final String currentStatus; // 'focused', 'resting', 'idle'
  final bool isLoading;

  const HomeState({
    this.focusScore = 75,
    this.energyLevel = 7,
    this.tasksCompleted = 3,
    this.focusMinutes = 120,
    this.currentStatus = 'idle',
    this.isLoading = false,
  });

  HomeState copyWith({
    int? focusScore,
    int? energyLevel,
    int? tasksCompleted,
    int? focusMinutes,
    String? currentStatus,
    bool? isLoading,
  }) {
    return HomeState(
      focusScore: focusScore ?? this.focusScore,
      energyLevel: energyLevel ?? this.energyLevel,
      tasksCompleted: tasksCompleted ?? this.tasksCompleted,
      focusMinutes: focusMinutes ?? this.focusMinutes,
      currentStatus: currentStatus ?? this.currentStatus,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        focusScore,
        energyLevel,
        tasksCompleted,
        focusMinutes,
        currentStatus,
        isLoading,
      ];
}

// --- Cubit ---
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> loadDashboard() async {
    emit(state.copyWith(isLoading: true));
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    emit(state.copyWith(
      isLoading: false,
      focusScore: 82,
      energyLevel: 6,
      tasksCompleted: 5,
      focusMinutes: 180,
    ));
  }

  void updateStatus(String status) {
    emit(state.copyWith(currentStatus: status));
  }
  
  void incrementFocusTime(int minutes) {
    emit(state.copyWith(focusMinutes: state.focusMinutes + minutes));
  }
}
