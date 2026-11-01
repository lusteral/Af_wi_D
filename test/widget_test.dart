import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:af_wi_desk/main.dart';
import 'package:af_wi_desk/view/splash_view.dart';
import 'package:af_wi_desk/view/welcome_view.dart';
import 'package:af_wi_desk/view/login_component.dart';
import 'package:af_wi_desk/view/dashboard_view.dart';
import 'package:af_wi_desk/view/chat_video_view.dart';

void main() {
  testWidgets('Complete User Navigation Scenario Flow Test',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    // 1. Initial Load -> Starts at SplashView
    await tester.pumpWidget(const AfwiDeskApp());
    await tester.pump();
    expect(find.byType(SplashView), findsOneWidget);

    // 2. Click Splash Screen -> Navigates to WelcomeView
    await tester.tap(find.byType(SplashView));
    await tester.pumpAndSettle();
    expect(find.byType(WelcomeView), findsOneWidget);

    // 3. Click 'Next' on WelcomeView -> Navigates to LoginComponent3View
    final nextBtn = find.widgetWithText(ElevatedButton, 'Next');
    expect(nextBtn, findsOneWidget);
    await tester.tap(nextBtn);
    await tester.pumpAndSettle();
    expect(find.byType(LoginComponent3View), findsOneWidget);

    // 4. Click 'تسجيل الدخول' -> Navigates to DashboardView
    final loginBtn = find.widgetWithText(ElevatedButton, 'تسجيل الدخول');
    expect(loginBtn, findsOneWidget);
    await tester.tap(loginBtn);
    await tester.pumpAndSettle();
    expect(find.byType(DashboardView), findsOneWidget);

    // 5. Click 'Message' in Sidebar -> Navigates to ChatVideoView
    final messageBtn = find.text('Message');
    expect(messageBtn, findsOneWidget);
    await tester.tap(messageBtn);
    await tester.pumpAndSettle();
    expect(find.byType(ChatVideoView), findsOneWidget);

    // 6. Click 'HOME' in Sidebar -> Navigates back to DashboardView
    final homeBtn = find.text('HOME');
    expect(homeBtn, findsOneWidget);
    await tester.tap(homeBtn);
    await tester.pumpAndSettle();
    expect(find.byType(DashboardView), findsOneWidget);
  });
}
