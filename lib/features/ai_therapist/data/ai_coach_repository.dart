import '../../../../core/services/gemini_service.dart';

class AiCoachRepository {
  final GeminiService _geminiService;

  AiCoachRepository({GeminiService? geminiService})
      : _geminiService = geminiService ?? GeminiService();

  Future<String> sendMessage(String message) async {
    // In a real app, we would maintain a chat session here
    // For now, we'll just use the single response method or start a new chat each time
    // ideally we should keep the session in the repository or cubit
    
    // Using dailyCheckIn for a more therapeutic vibe, or generic response
    return await _geminiService.dailyCheckIn(message);
  }
}
