import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/ai_coach_repository.dart';

// --- State ---
class ChatMessage extends Equatable {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, text, isUser, timestamp];
}

abstract class AiCoachState extends Equatable {
  const AiCoachState();

  @override
  List<Object?> get props => [];
}

class AiCoachInitial extends AiCoachState {}

class AiCoachLoaded extends AiCoachState {
  final List<ChatMessage> messages;
  final bool isTyping;

  const AiCoachLoaded({
    this.messages = const [],
    this.isTyping = false,
  });

  @override
  List<Object?> get props => [messages, isTyping];
}

class AiCoachError extends AiCoachState {
  final String message;

  const AiCoachError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- Cubit ---
class AiCoachCubit extends Cubit<AiCoachState> {
  final AiCoachRepository _repository;

  AiCoachCubit({required AiCoachRepository repository})
      : _repository = repository,
        super(const AiCoachLoaded(messages: [])) {
    // Add initial greeting
    emit(AiCoachLoaded(
      messages: [
        ChatMessage(
          id: 'welcome',
          text: 'Hello! I\'m your AI Coach. How are you feeling today?',
          isUser: false,
          timestamp: DateTime.now(),
        ),
      ],
    ));
  }

  Future<void> sendMessage(String text) async {
    final currentState = state;
    if (currentState is! AiCoachLoaded) return;

    final userMessage = ChatMessage(
      id: DateTime.now().toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    emit(AiCoachLoaded(
      messages: [...currentState.messages, userMessage],
      isTyping: true,
    ));

    try {
      final responseText = await _repository.sendMessage(text);
      
      final aiMessage = ChatMessage(
        id: DateTime.now().toString(),
        text: responseText,
        isUser: false,
        timestamp: DateTime.now(),
      );

      emit(AiCoachLoaded(
        messages: [...currentState.messages, userMessage, aiMessage],
        isTyping: false,
      ));
    } catch (e) {
      emit(AiCoachError('Failed to get response: ${e.toString()}'));
      // Revert to loaded state after error, maybe keep user message?
      // For simplicity, we just show error state. 
      // In production, we'd handle this more gracefully.
    }
  }
}
