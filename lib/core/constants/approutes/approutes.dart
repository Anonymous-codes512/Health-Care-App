import 'package:doctor_app/presentation/screens/auth/forgot_password_screen.dart';
import 'package:doctor_app/presentation/screens/auth/login_screen.dart';
import 'package:doctor_app/presentation/screens/auth/opening_screen.dart';
import 'package:doctor_app/presentation/screens/auth/otp_verification_screen.dart';
import 'package:doctor_app/presentation/screens/auth/password_changed_screen.dart';
import 'package:doctor_app/presentation/screens/auth/register_screen.dart';
import 'package:doctor_app/presentation/screens/auth/reset_password_screen.dart';
import 'package:doctor_app/presentation/screens/home/home_screen.dart';
import 'package:doctor_app/presentation/screens/messages/all_message_screen.dart';
import 'package:doctor_app/presentation/screens/messages/chat_screen.dart';
import 'package:doctor_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:doctor_app/presentation/screens/splash screen/splash_screen.dart';
import 'package:doctor_app/presentation/screens/video/all_video_screen.dart';
import 'package:doctor_app/presentation/screens/voice/all_voice_screen.dart';
import 'package:doctor_app/presentation/screens/voice/call_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String openingScreen = '/opening_screen';
  static const String registerScreen = '/register_screen';
  static const String loginScreen = '/login_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String otpVerificationScreen = '/otp_verification_screen';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String passwordChangedScreen = '/password_changed_screen';
  static const String homeScreen = '/home_screen';
  static const String allmessageScreen = '/all_message_screen';
  static const String chatScreen = '/chat_screen';
  static const String allVoiceCallsScreen = '/all_voice_screen';
  static const String voiceCallDetailScreen = '/voice_details_screen';
  static const String voiceCallScreen = '/voice_call_screen';
  static const String allVideoCallsScreen = '/all_video_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case openingScreen:
        return MaterialPageRoute(builder: (_) => const OpenningScreen());
      case registerScreen:
        final role = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => RegisterScreen(role: role));
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case otpVerificationScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(email: email),
        );
      case resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case passwordChangedScreen:
        return MaterialPageRoute(builder: (_) => PasswordChangedScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case allmessageScreen:
        return MaterialPageRoute(builder: (_) => AllMessageScreen());
      case chatScreen:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case allVoiceCallsScreen:
        return MaterialPageRoute(builder: (_) => AllVoiceCallScreen());
      case voiceCallScreen:
        return MaterialPageRoute(builder: (_) => CallScreen());

      case allVideoCallsScreen:
        return MaterialPageRoute(builder: (_) => AllVideoCallScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
