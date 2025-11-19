import 'package:google_generative_ai/google_generative_ai.dart';
import '../constants/app_config.dart';

/// Gemini AI Service
/// Handles all interactions with Google Gemini API
class GeminiService {
  late final GenerativeModel _model;
  late final GenerativeModel _chatModel;
  
  GeminiService() {
    // Initialize Gemini Pro model for general AI tasks
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: AppConfig.geminiApiKey,
    );
    
    // Initialize chat model for conversational AI
    _chatModel = GenerativeModel(
      model: 'gemini-pro',
      apiKey: AppConfig.geminiApiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 1024,
      ),
    );
  }
  
  /// Generate AI response for a single prompt
  Future<String> generateResponse(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'No response generated';
    } catch (e) {
      throw Exception('Failed to generate AI response: $e');
    }
  }
  
  /// Start a chat session
  ChatSession startChat({List<Content>? history}) {
    return _chatModel.startChat(history: history);
  }
  
  /// Generate AI coach recommendation based on user state
  Future<String> getCoachRecommendation({
    required String currentStatus,
    required int focusScore,
    required int energyLevel,
    String? additionalContext,
  }) async {
    final prompt = '''
You are FocusForge AI Coach, helping freelancers prevent burnout.

User Status:
- Current State: $currentStatus
- Focus Score: $focusScore/100
- Energy Level: $energyLevel/10
${additionalContext != null ? '- Additional Context: $additionalContext' : ''}

Provide a brief, empathetic recommendation (2-3 sentences) on what the user should do next.
Focus on actionable micro-habits or breaks that can help them recover or maintain their state.
''';
    
    return await generateResponse(prompt);
  }
  
  /// Suggest a micro-habit based on current state
  Future<Map<String, dynamic>> suggestMicroHabit({
    required String currentStatus,
    required int energyLevel,
    required String timeOfDay,
  }) async {
    // final prompt = '''...'''; // Unused for now
    
    // Mock implementation until we parse JSON
    return {
      'name': 'Deep Breathing',
      'description': 'Take 5 deep breaths to reset your mind',
      'duration': 2,
      'category': 'breathing',
    };
  }
  
  /// Analyze weekly performance and provide insights
  Future<String> analyzeWeeklyPerformance({
    required double avgFocusScore,
    required int totalFocusTime,
    required int tasksCompleted,
    required Map<String, int> statusDistribution,
  }) async {
    final prompt = '''
You are FocusForge AI Coach. Analyze the user's weekly performance.

Weekly Stats:
- Average Focus Score: ${avgFocusScore.toStringAsFixed(1)}/100
- Total Focus Time: $totalFocusTime minutes
- Tasks Completed: $tasksCompleted
- Status Distribution: $statusDistribution

Provide:
1. A brief analysis (2-3 sentences) of their week
2. One key insight
3. One actionable recommendation for next week

Keep it encouraging and actionable.
''';
    
    return await generateResponse(prompt);
  }
  
  /// Daily check-in conversation
  Future<String> dailyCheckIn(String userResponse) async {
    final prompt = '''
You are FocusForge AI Therapist. The user just responded to "How are you feeling today?"

User Response: "$userResponse"

Provide an empathetic, brief response (2-3 sentences) that:
1. Acknowledges their feelings
2. Offers gentle support or encouragement
3. Optionally suggests a next step if they're struggling

Be warm, human, and non-judgmental.
''';
    
    return await generateResponse(prompt);
  }
  
  /// Deep therapy session (Premium feature)
  Future<String> deepTherapySession({
    required String userMessage,
    required List<Content> conversationHistory,
  }) async {
    final chat = startChat(history: conversationHistory);
    final response = await chat.sendMessage(Content.text(userMessage));
    return response.text ?? 'No response generated';
  }
}
