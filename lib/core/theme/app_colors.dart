import 'package:flutter/material.dart';

/// App Color Palette
/// Deep Blue → Teal → Purple gradients with dark theme
class AppColors {
  // Primary Colors
  static const Color deepBlue = Color(0xFF1A237E);
  static const Color teal = Color(0xFF00897B);
  static const Color purple = Color(0xFF7B1FA2);
  
  // Semantic Colors
  static const Color primary = teal;
  static const Color secondary = purple;
  static const Color tertiary = deepBlue;
  
  // Background Colors (Dark Theme)
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color surfaceVariant = Color(0xFF2C2C2C);
  
  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textTertiary = Color(0xFF808080);
  
  // Status Colors
  static const Color energized = Color(0xFF4CAF50); // Green
  static const Color focused = Color(0xFF2196F3);   // Blue
  static const Color tired = Color(0xFFFF9800);     // Orange
  static const Color burnout = Color(0xFFF44336);   // Red
  
  // Accent Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [deepBlue, teal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [teal, purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient fullGradient = LinearGradient(
    colors: [deepBlue, teal, purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Chart Colors
  static const List<Color> chartColors = [
    teal,
    purple,
    deepBlue,
    Color(0xFF00BCD4),
    Color(0xFF9C27B0),
  ];
}

/// App Typography
class AppTypography {
  static const String fontFamily = 'Inter';
  
  // Font Sizes
  static const double h1 = 48.0;
  static const double h2 = 32.0;
  static const double h3 = 24.0;
  static const double h4 = 18.0;
  static const double body = 16.0;
  static const double small = 14.0;
  static const double tiny = 12.0;
  
  // Text Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: h1,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: h2,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: h3,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );
  
  static const TextStyle heading4 = TextStyle(
    fontSize: h4,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );
  
  static const TextStyle bodyText = TextStyle(
    fontSize: body,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: fontFamily,
  );
  
  static const TextStyle smallText = TextStyle(
    fontSize: small,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: fontFamily,
  );
  
  static const TextStyle tinyText = TextStyle(
    fontSize: tiny,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    fontFamily: fontFamily,
  );
}

/// App Spacing
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

/// App Border Radius
class AppRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double round = 999.0;
}
