import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants/app_config.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/logic/auth_cubit.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/pages/splash_screen.dart';
import 'features/focus_timer/presentation/pages/focus_timer_page.dart';
import 'features/tracker/presentation/pages/mood_page.dart';
import 'features/ai_therapist/presentation/pages/ai_coach_page.dart';
import 'features/onboarding/presentation/pages/onboarding_page.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive for local storage
  await Hive.initFlutter();
  
  // Initialize Supabase
  if (AppConfig.supabaseUrl.isNotEmpty && AppConfig.supabaseAnonKey.isNotEmpty) {
    await Supabase.initialize(
      url: AppConfig.supabaseUrl,
      anonKey: AppConfig.supabaseAnonKey,
    );
  }
  
  runApp(const FocusForgeApp());
}

class FocusForgeApp extends StatelessWidget {
  const FocusForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if Supabase is initialized
    final isSupabaseInitialized = AppConfig.supabaseUrl.isNotEmpty && AppConfig.supabaseAnonKey.isNotEmpty;

    return MultiRepositoryProvider(
      providers: [
        if (isSupabaseInitialized)
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository(),
          ),
      ],
      child: MultiBlocProvider(
        providers: [
          if (isSupabaseInitialized)
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
        ],
        child: MaterialApp(
          title: AppConfig.appName,
          debugShowCheckedModeBanner: false,
          
          // Theme
          theme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          
          // Localization
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          
          // Routes
          home: const SplashScreen(),
          routes: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/onboarding': (context) => const OnboardingPage(),
            '/home': (context) => const HomePage(),
            '/focus_timer': (context) => const FocusTimerPage(),
            '/mood_tracker': (context) => const MoodPage(),
            '/ai_coach': (context) => const AiCoachPage(),
          },
        ),
      ),
    );
  }
}
