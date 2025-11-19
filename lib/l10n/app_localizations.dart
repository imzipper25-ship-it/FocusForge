import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'FocusForge'**
  String get appTitle;

  /// Welcome message on splash screen
  ///
  /// In en, this message translates to:
  /// **'Your AI Coach Against Burnout'**
  String get welcomeMessage;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @focusScore.
  ///
  /// In en, this message translates to:
  /// **'Focus Score'**
  String get focusScore;

  /// No description provided for @energized.
  ///
  /// In en, this message translates to:
  /// **'Energized'**
  String get energized;

  /// No description provided for @focused.
  ///
  /// In en, this message translates to:
  /// **'Focused'**
  String get focused;

  /// No description provided for @tired.
  ///
  /// In en, this message translates to:
  /// **'Tired'**
  String get tired;

  /// No description provided for @burnout.
  ///
  /// In en, this message translates to:
  /// **'Burnout'**
  String get burnout;

  /// No description provided for @onboardingRole.
  ///
  /// In en, this message translates to:
  /// **'What describes you best?'**
  String get onboardingRole;

  /// No description provided for @roleFreelancer.
  ///
  /// In en, this message translates to:
  /// **'Freelancer'**
  String get roleFreelancer;

  /// No description provided for @roleRemoteWorker.
  ///
  /// In en, this message translates to:
  /// **'Remote Worker'**
  String get roleRemoteWorker;

  /// No description provided for @roleManager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get roleManager;

  /// No description provided for @roleStudent.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get roleStudent;

  /// No description provided for @onboardingHours.
  ///
  /// In en, this message translates to:
  /// **'How many hours do you spend on your computer daily?'**
  String get onboardingHours;

  /// No description provided for @hours4to6.
  ///
  /// In en, this message translates to:
  /// **'4-6 hours'**
  String get hours4to6;

  /// No description provided for @hours6to8.
  ///
  /// In en, this message translates to:
  /// **'6-8 hours'**
  String get hours6to8;

  /// No description provided for @hours8to10.
  ///
  /// In en, this message translates to:
  /// **'8-10 hours'**
  String get hours8to10;

  /// No description provided for @hoursMore10.
  ///
  /// In en, this message translates to:
  /// **'10+ hours'**
  String get hoursMore10;

  /// No description provided for @onboardingPain.
  ///
  /// In en, this message translates to:
  /// **'What\'s your main challenge?'**
  String get onboardingPain;

  /// No description provided for @painBurnout.
  ///
  /// In en, this message translates to:
  /// **'Burnout'**
  String get painBurnout;

  /// No description provided for @painProcrastination.
  ///
  /// In en, this message translates to:
  /// **'Procrastination'**
  String get painProcrastination;

  /// No description provided for @painAnxiety.
  ///
  /// In en, this message translates to:
  /// **'Anxiety'**
  String get painAnxiety;

  /// No description provided for @painEnergyLoss.
  ///
  /// In en, this message translates to:
  /// **'Energy Loss'**
  String get painEnergyLoss;

  /// No description provided for @painAdhd.
  ///
  /// In en, this message translates to:
  /// **'ADHD-like symptoms'**
  String get painAdhd;

  /// No description provided for @onboardingBurnoutLevel.
  ///
  /// In en, this message translates to:
  /// **'How would you rate your current burnout level?'**
  String get onboardingBurnoutLevel;

  /// No description provided for @burnoutLevelLow.
  ///
  /// In en, this message translates to:
  /// **'Low (1-3)'**
  String get burnoutLevelLow;

  /// No description provided for @burnoutLevelMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium (4-6)'**
  String get burnoutLevelMedium;

  /// No description provided for @burnoutLevelHigh.
  ///
  /// In en, this message translates to:
  /// **'High (7-10)'**
  String get burnoutLevelHigh;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// No description provided for @trackerTitle.
  ///
  /// In en, this message translates to:
  /// **'Tracker'**
  String get trackerTitle;

  /// No description provided for @habitsTitle.
  ///
  /// In en, this message translates to:
  /// **'Habits'**
  String get habitsTitle;

  /// No description provided for @communityTitle.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get communityTitle;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @imFeeling.
  ///
  /// In en, this message translates to:
  /// **'I\'m feeling...'**
  String get imFeeling;

  /// No description provided for @todayProgress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Progress'**
  String get todayProgress;

  /// No description provided for @focusTime.
  ///
  /// In en, this message translates to:
  /// **'Focus Time'**
  String get focusTime;

  /// No description provided for @tasksCompleted.
  ///
  /// In en, this message translates to:
  /// **'Tasks Completed'**
  String get tasksCompleted;

  /// No description provided for @microHabits.
  ///
  /// In en, this message translates to:
  /// **'Micro-Habits'**
  String get microHabits;

  /// No description provided for @takeABreak.
  ///
  /// In en, this message translates to:
  /// **'Take a Break'**
  String get takeABreak;

  /// No description provided for @startPomodoro.
  ///
  /// In en, this message translates to:
  /// **'Start Pomodoro'**
  String get startPomodoro;

  /// No description provided for @deepFocus.
  ///
  /// In en, this message translates to:
  /// **'Deep Focus'**
  String get deepFocus;

  /// No description provided for @weeklyReport.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get weeklyReport;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get lastWeek;

  /// No description provided for @avgFocusScore.
  ///
  /// In en, this message translates to:
  /// **'Avg Focus Score'**
  String get avgFocusScore;

  /// No description provided for @totalFocusTime.
  ///
  /// In en, this message translates to:
  /// **'Total Focus Time'**
  String get totalFocusTime;

  /// No description provided for @youSurvivedAnotherWeek.
  ///
  /// In en, this message translates to:
  /// **'You survived another week! 🎉'**
  String get youSurvivedAnotherWeek;

  /// No description provided for @dailyWins.
  ///
  /// In en, this message translates to:
  /// **'Daily Wins'**
  String get dailyWins;

  /// No description provided for @shareYourWin.
  ///
  /// In en, this message translates to:
  /// **'Share your win...'**
  String get shareYourWin;

  /// No description provided for @victoryFeed.
  ///
  /// In en, this message translates to:
  /// **'Victory Feed'**
  String get victoryFeed;

  /// No description provided for @postWin.
  ///
  /// In en, this message translates to:
  /// **'Post Win'**
  String get postWin;

  /// No description provided for @aiCoach.
  ///
  /// In en, this message translates to:
  /// **'AI Coach'**
  String get aiCoach;

  /// No description provided for @aiTherapist.
  ///
  /// In en, this message translates to:
  /// **'AI Therapist'**
  String get aiTherapist;

  /// No description provided for @startSession.
  ///
  /// In en, this message translates to:
  /// **'Start Session'**
  String get startSession;

  /// No description provided for @voiceMode.
  ///
  /// In en, this message translates to:
  /// **'Voice Mode'**
  String get voiceMode;

  /// No description provided for @textMode.
  ///
  /// In en, this message translates to:
  /// **'Text Mode'**
  String get textMode;

  /// No description provided for @howAreYouToday.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get howAreYouToday;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// No description provided for @upgradeToPremium.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get upgradeToPremium;

  /// No description provided for @premiumFeatures.
  ///
  /// In en, this message translates to:
  /// **'Premium Features'**
  String get premiumFeatures;

  /// No description provided for @unlimitedAi.
  ///
  /// In en, this message translates to:
  /// **'Unlimited AI requests'**
  String get unlimitedAi;

  /// No description provided for @voiceModeAccess.
  ///
  /// In en, this message translates to:
  /// **'Voice mode access'**
  String get voiceModeAccess;

  /// No description provided for @weeklyReports.
  ///
  /// In en, this message translates to:
  /// **'Weekly AI reports'**
  String get weeklyReports;

  /// No description provided for @allHabits.
  ///
  /// In en, this message translates to:
  /// **'All micro-habits'**
  String get allHabits;

  /// No description provided for @prioritySupport.
  ///
  /// In en, this message translates to:
  /// **'Priority support'**
  String get prioritySupport;

  /// No description provided for @monthlyPlan.
  ///
  /// In en, this message translates to:
  /// **'Monthly Plan'**
  String get monthlyPlan;

  /// No description provided for @yearlyPlan.
  ///
  /// In en, this message translates to:
  /// **'Yearly Plan'**
  String get yearlyPlan;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get perMonth;

  /// No description provided for @perYear.
  ///
  /// In en, this message translates to:
  /// **'/year'**
  String get perYear;

  /// Savings percentage
  ///
  /// In en, this message translates to:
  /// **'Save {percent}%'**
  String savePercent(int percent);

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection.'**
  String get errorNetwork;

  /// No description provided for @focusScoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Focus Score'**
  String get focusScoreTitle;

  /// No description provided for @focusScoreExcellent.
  ///
  /// In en, this message translates to:
  /// **'EXCELLENT'**
  String get focusScoreExcellent;

  /// No description provided for @focusScoreGood.
  ///
  /// In en, this message translates to:
  /// **'GOOD'**
  String get focusScoreGood;

  /// No description provided for @focusScoreNeedsAttention.
  ///
  /// In en, this message translates to:
  /// **'NEEDS ATTENTION'**
  String get focusScoreNeedsAttention;

  /// No description provided for @focusScoreMessage.
  ///
  /// In en, this message translates to:
  /// **'Your focus is optimized for deep work today.'**
  String get focusScoreMessage;

  /// No description provided for @actionStartFocus.
  ///
  /// In en, this message translates to:
  /// **'Start Focus'**
  String get actionStartFocus;

  /// No description provided for @actionLogMood.
  ///
  /// In en, this message translates to:
  /// **'Log Mood'**
  String get actionLogMood;

  /// No description provided for @actionAiCoach.
  ///
  /// In en, this message translates to:
  /// **'AI Coach'**
  String get actionAiCoach;

  /// No description provided for @dailySummary.
  ///
  /// In en, this message translates to:
  /// **'Daily Summary'**
  String get dailySummary;

  /// No description provided for @statFocusTime.
  ///
  /// In en, this message translates to:
  /// **'Focus Time'**
  String get statFocusTime;

  /// No description provided for @statTasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get statTasks;

  /// No description provided for @statEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get statEnergy;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Good Morning, {name}'**
  String greeting(String name);

  /// No description provided for @greetingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to focus?'**
  String get greetingSubtitle;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
