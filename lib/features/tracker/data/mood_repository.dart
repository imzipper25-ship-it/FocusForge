import 'package:supabase_flutter/supabase_flutter.dart';

class MoodEntry {
  final int moodRating; // 1-5
  final int energyLevel; // 1-10
  final String? note;
  final DateTime timestamp;

  MoodEntry({
    required this.moodRating,
    required this.energyLevel,
    this.note,
    required this.timestamp,
  });
}

class MoodRepository {
  // final SupabaseClient? _supabase;

  MoodRepository({SupabaseClient? supabase}); // : _supabase = supabase;

  Future<void> logMood({
    required int moodRating,
    required int energyLevel,
    String? note,
  }) async {
    // TODO: Implement actual Supabase saving
    // await _supabase?.from('mood_logs').insert({...});
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // Mood logged: $moodRating, Energy: $energyLevel, Note: $note
  }
}
