/// API Keys and Configuration
class AppConfig {
  // Gemini AI
  static const String geminiApiKey = 'AIzaSyC4GtMoHSl-ZiSb6cjFHpqslJDnWTjUyos';
  
  // Supabase (TODO: Replace with your Supabase credentials)
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
  
  // App Info
  static const String appName = 'FocusForge';
  static const String appVersion = '1.0.0';
  
  // Free Tier Limits
  static const int freeAiRequestsPerDay = 3;
  
  // Premium Pricing
  static const double premiumMonthlyPrice = 9.99;
  static const double premiumYearlyPrice = 79.99;
  
  // Community
  static const int maxDailyWinsPosts = 50;
  
  // AI Session
  static const int maxDeepSessionMinutes = 10;
}
