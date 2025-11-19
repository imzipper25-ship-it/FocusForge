import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// --- State ---
enum TimerStatus { initial, running, paused, completed }

class FocusTimerState extends Equatable {
  final TimerStatus status;
  final int duration; // Total duration in seconds
  final int elapsed; // Elapsed time in seconds

  const FocusTimerState({
    this.status = TimerStatus.initial,
    this.duration = 25 * 60, // Default 25 minutes
    this.elapsed = 0,
  });

  int get remaining => duration - elapsed;
  double get progress => duration > 0 ? elapsed / duration : 0.0;

  FocusTimerState copyWith({
    TimerStatus? status,
    int? duration,
    int? elapsed,
  }) {
    return FocusTimerState(
      status: status ?? this.status,
      duration: duration ?? this.duration,
      elapsed: elapsed ?? this.elapsed,
    );
  }

  @override
  List<Object?> get props => [status, duration, elapsed];
}

// --- Cubit ---
class FocusTimerCubit extends Cubit<FocusTimerState> {
  Timer? _timer;

  FocusTimerCubit() : super(const FocusTimerState());

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void startTimer() {
    if (state.status == TimerStatus.running) return;

    emit(state.copyWith(status: TimerStatus.running));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remaining > 0) {
        emit(state.copyWith(elapsed: state.elapsed + 1));
      } else {
        _timer?.cancel();
        emit(state.copyWith(status: TimerStatus.completed));
      }
    });
  }

  void pauseTimer() {
    if (state.status == TimerStatus.running) {
      _timer?.cancel();
      emit(state.copyWith(status: TimerStatus.paused));
    }
  }

  void resumeTimer() {
    if (state.status == TimerStatus.paused) {
      startTimer();
    }
  }

  void stopTimer() {
    _timer?.cancel();
    emit(const FocusTimerState(status: TimerStatus.initial));
  }
  
  void setDuration(int minutes) {
    if (state.status == TimerStatus.initial) {
      emit(state.copyWith(duration: minutes * 60, elapsed: 0));
    }
  }
}
