import 'package:flutter/material.dart';
import 'view/splash_view.dart';
import 'view/welcome_view.dart';
import 'view/login_component.dart';
import 'view/dashboard_view.dart';
import 'view/chat_video_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AfwiDeskApp());
}

class AfwiDeskApp extends StatelessWidget {
  const AfwiDeskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AFWI Desktop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        fontFamily: 'Segoe UI',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E1B4B),
          primary: const Color(0xFF1E1B4B),
          secondary: const Color(0xFF26B7AB),
        ),
      ),
      // التسلسل يبدأ من شاشة السبالش (Splash)
      home: const SplashView(),
      routes: {
        '/splash': (context) => const SplashView(),
        '/welcome': (context) => const WelcomeView(),
        '/login': (context) => const LoginComponent3View(),
        '/dashboard': (context) => const DashboardView(),
        '/chat': (context) => const ChatVideoView(),
      },
    );
  }
}
