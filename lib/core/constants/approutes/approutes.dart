import 'package:doctor_app/presentation/reports/all_patients_reports.dart';
import 'package:doctor_app/presentation/screens/appointment/appointment_screen.dart';
import 'package:doctor_app/presentation/screens/auth/forgot_password_screen.dart';
import 'package:doctor_app/presentation/screens/auth/login_screen.dart';
import 'package:doctor_app/presentation/screens/auth/opening_screen.dart';
import 'package:doctor_app/presentation/screens/auth/otp_verification_screen.dart';
import 'package:doctor_app/presentation/screens/auth/password_changed_screen.dart';
import 'package:doctor_app/presentation/screens/auth/register_screen.dart';
import 'package:doctor_app/presentation/screens/auth/reset_password_screen.dart';
import 'package:doctor_app/presentation/screens/calendar/add_appointment_screen.dart';
import 'package:doctor_app/presentation/screens/calendar/add_task_screen.dart';
import 'package:doctor_app/presentation/screens/calendar/calendar_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/bmi%20tracker/bmi_record_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/bmi%20tracker/bmi_tacker_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/bp%20tracker/bp_record_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/bp%20tracker/bp_tacker_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/analysis_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/health_tracker_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/health_tracker_start_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/pulse%20tracker/pulse_record_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/pulse%20tracker/pulse_tacker_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/reminders_settings_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/steps%20and%20calories%20counter/steps_and_calories_counter_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/weight%20tracker/weight_record_screen.dart';
import 'package:doctor_app/presentation/screens/health%20tracker%20screen/weight%20tracker/weight_tacker_screen.dart';
import 'package:doctor_app/presentation/screens/home/home_screen.dart';
import 'package:doctor_app/presentation/screens/invoice/invoice_details_screen.dart';
import 'package:doctor_app/presentation/screens/invoice/my_invoices_screen.dart';
import 'package:doctor_app/presentation/screens/messages/all_message_screen.dart';
import 'package:doctor_app/presentation/screens/messages/chat_screen.dart';
import 'package:doctor_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:doctor_app/presentation/screens/payment/my_payments_screen.dart';
import 'package:doctor_app/presentation/screens/splash screen/splash_screen.dart';
import 'package:doctor_app/presentation/screens/task/task_screen.dart';
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
  static const String healthTrackerStartScreen = '/health_tracker_start_screen';
  static const String healthTrackerScreen = '/health_tracker_screen';
  static const String analysisScreen = '/analysis_screen';
  static const String remindersSettingsScreen = '/reminders_settings_screen';
  static const String bpTrackerScreen = '/bp_tracker_screen';
  static const String bpRecordScreen = '/bp_record_screen';
  static const String weightTrackerScreen = '/weight_tracker_screen';
  static const String weightRecordScreen = '/weight_record_screen';
  static const String bmiTrackerScreen = '/bmi_tracker_screen';
  static const String bmiRecordScreen = '/bmi_record_screen';
  static const String pulseTrackerScreen = '/pulse_tracker_screen';
  static const String pulseRecordScreen = '/pulse_record_screen';
  static const String stepsAndCaloriesCounterScreen =
      '/steps_and_calories-ccounter_screen';
  static const String calendarScreen = '/calendar_screen';
  static const String addNewTaskScreen = '/add_new_task_screen';
  static const String addNewAppointmentScreen = '/add_new_appointment_screen';

  static const String myAppointmentScreen = '/my_appointment_screen';
  static const String myTaskScreen = '/my_task_screen';

  static const String myInvoicesScreen = '/my_invoices_screen';
  static const String invoiceDetailScreen = '/invoice_detail_screen';
  static const String paymentsScreen = '/payments_screen';
  static const String allPatientsReportsScreen = '/all_patients_reports_screen';

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
      case healthTrackerStartScreen:
        return MaterialPageRoute(builder: (_) => HealthTrackerStartScreen());
      case healthTrackerScreen:
        return MaterialPageRoute(builder: (_) => HealthTrackerScreen());
      case analysisScreen:
        return MaterialPageRoute(builder: (_) => AnalysisScreen());
      case remindersSettingsScreen:
        return MaterialPageRoute(builder: (_) => RemindersSettingsScreen());
      case bpRecordScreen:
        return MaterialPageRoute(builder: (_) => BpRecordScreen());
      case bpTrackerScreen:
        final args = settings.arguments;
        List<Map<String, String>> records = [];
        if (args != null && args is List<Map<String, String>>) {
          records = args;
        }
        return MaterialPageRoute(
          builder: (_) => BpTrackerScreen(records: records),
        );

      case weightRecordScreen:
        return MaterialPageRoute(builder: (_) => WeightRecordScreen());
      case weightTrackerScreen:
        final args = settings.arguments;
        List<Map<String, String>> records = [];
        if (args != null && args is List<Map<String, String>>) {
          records = args;
        }
        return MaterialPageRoute(
          builder: (_) => WeightTrackerScreen(records: records),
        );

      case bmiRecordScreen:
        return MaterialPageRoute(builder: (_) => BMIRecordScreen());
      case bmiTrackerScreen:
        final args = settings.arguments;
        List<Map<String, String>> records = [];
        if (args != null && args is List<Map<String, String>>) {
          records = args;
        }
        return MaterialPageRoute(
          builder: (_) => BMITrackerScreen(records: records),
        );

      case pulseRecordScreen:
        return MaterialPageRoute(builder: (_) => PulseRecordScreen());
      case pulseTrackerScreen:
        final args = settings.arguments;
        List<Map<String, String>> records = [];
        if (args != null && args is List<Map<String, String>>) {
          records = args;
        }
        return MaterialPageRoute(
          builder: (_) => PulseTrackerScreen(records: records),
        );
      case stepsAndCaloriesCounterScreen:
        return MaterialPageRoute(builder: (_) => StepsCaloriesCounterScreen());
      case calendarScreen:
        return MaterialPageRoute(builder: (_) => CalendarScreen());
      case addNewTaskScreen:
        return MaterialPageRoute(builder: (_) => AddTaskScreen());
      case addNewAppointmentScreen:
        return MaterialPageRoute(builder: (_) => AddAppointmentScreen());

      case myAppointmentScreen:
        return MaterialPageRoute(builder: (_) => AppointmentScreen());

      case myTaskScreen:
        return MaterialPageRoute(builder: (_) => TaskScreen());

      case myInvoicesScreen:
        return MaterialPageRoute(builder: (_) => MyInvoicesScreen());

      case invoiceDetailScreen:
        final args = settings.arguments;
        Map<String, dynamic> invoice = {};
        if (args != null && args is Map<String, dynamic>) {
          invoice = args;
        }
        return MaterialPageRoute(
          builder: (_) => InvoiceDetailsScreen(invoice: invoice),
        );

      case paymentsScreen:
        return MaterialPageRoute(builder: (_) => MyPaymentsScreen());

      case allPatientsReportsScreen:
        return MaterialPageRoute(builder: (_) => AllPatientsReportsScreen());

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
