import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// --- State ---
class OnboardingState extends Equatable {
  final int currentPage;
  final String? selectedRole;
  final String? dailyHours;
  final String? mainPainPoint;
  final int? burnoutLevel;
  final bool isSubmitting;

  const OnboardingState({
    this.currentPage = 0,
    this.selectedRole,
    this.dailyHours,
    this.mainPainPoint,
    this.burnoutLevel,
    this.isSubmitting = false,
  });

  OnboardingState copyWith({
    int? currentPage,
    String? selectedRole,
    String? dailyHours,
    String? mainPainPoint,
    int? burnoutLevel,
    bool? isSubmitting,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      selectedRole: selectedRole ?? this.selectedRole,
      dailyHours: dailyHours ?? this.dailyHours,
      mainPainPoint: mainPainPoint ?? this.mainPainPoint,
      burnoutLevel: burnoutLevel ?? this.burnoutLevel,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [
        currentPage,
        selectedRole,
        dailyHours,
        mainPainPoint,
        burnoutLevel,
        isSubmitting,
      ];
}

// --- Cubit ---
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void nextPage() {
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }

  void previousPage() {
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  void setRole(String role) {
    emit(state.copyWith(selectedRole: role));
  }

  void setDailyHours(String hours) {
    emit(state.copyWith(dailyHours: hours));
  }

  void setMainPainPoint(String pain) {
    emit(state.copyWith(mainPainPoint: pain));
  }

  void setBurnoutLevel(int level) {
    emit(state.copyWith(burnoutLevel: level));
  }

  Future<void> completeOnboarding() async {
    emit(state.copyWith(isSubmitting: true));
    
    // Simulate API call / Local storage save
    await Future.delayed(const Duration(seconds: 1));
    
    // TODO: Save user data to Supabase/Hive
    
    emit(state.copyWith(isSubmitting: false));
  }
}
