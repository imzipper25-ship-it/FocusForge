import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    
    _controller.forward();
    
    // Navigate to next screen after 3 seconds
    Timer(const Duration(seconds: 3), _navigateToNextScreen);
  }

  void _navigateToNextScreen() {
    if (!mounted) return;
    // Temporary bypass of auth flow
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.fullGradient,
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Icon/Logo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(AppRadius.xl),
                    ),
                    child: const Icon(
                      Icons.psychology_outlined,
                      size: 64,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  
                  const SizedBox(height: AppSpacing.xl),
                  
                  // App Name
                  const Text(
                    AppConfig.appName,
                    style: TextStyle(
                      fontSize: AppTypography.h1,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                  
                  const SizedBox(height: AppSpacing.sm),
                  
                  // Tagline
                  const Text(
                    'Your AI Coach Against Burnout',
                    style: TextStyle(
                      fontSize: AppTypography.body,
                      color: AppColors.textSecondary,
                      fontFamily: AppTypography.fontFamily,
                    ),
                  ),
                  
                  const SizedBox(height: AppSpacing.xxl),
                  
                  // Loading Indicator
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.textPrimary),
                      strokeWidth: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
