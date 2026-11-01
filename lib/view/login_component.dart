import 'package:flutter/material.dart';
import 'widgets/decorative_squares.dart';
import 'dashboard_view.dart';

/// واجهة Login_Component 3
/// شاشة منبثقة (Popup / Modal Dialog) أو واجهة كاملة بخلفية بيضاء مطابقة لتصميم Figma
class LoginComponent3 extends StatefulWidget {
  final VoidCallback? onLoginSuccess;
  final VoidCallback? onClose;

  const LoginComponent3({
    super.key,
    this.onLoginSuccess,
    this.onClose,
  });

  /// دالة مساعدة لفتح الواجهة كشاشة منبثقة بخلفية بيضاء
  static Future<T?> show<T>(BuildContext context, {VoidCallback? onLoginSuccess}) {
    return showDialog<T>(
      context: context,
      barrierColor: Colors.white.withValues(alpha: 0.92), // خلفية بيضاء منبثقة
      barrierDismissible: true,
      builder: (ctx) => Center(
        child: SingleChildScrollView(
          child: LoginComponent3(
            onLoginSuccess: () {
              Navigator.of(ctx).pop();
              onLoginSuccess?.call();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const DashboardView()),
              );
            },
            onClose: () => Navigator.of(ctx).pop(),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginComponent3> createState() => _LoginComponent3State();
}

class _LoginComponent3State extends State<LoginComponent3> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleLogin() {
    widget.onLoginSuccess?.call();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const DashboardView()),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 520,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 34),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top section: Title on Right, Decorative pastel squares on Left
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Subtitle on the right (first child in RTL)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 12),
                            Text(
                              'معهد افواي ......',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1E1B4B),
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'حيث يبدأ التميز',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Decorative rounded squares on the left
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: const DecorativeSquares(scale: 0.85),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // 1. Username Field
                  const Text(
                    'أسم المستخدم',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _usernameController,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                    ),
                    decoration: InputDecoration(
                      hintText: 'ادخل أسم المستخدم',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Color(0xFFD1D5DB),
                          width: 1.1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Color(0xFF26B7AB),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 2. Password Field
                  const Text(
                    'كلمة المرور',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B5563),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                    ),
                    decoration: InputDecoration(
                      hintText: 'ادخل كلمة المرور',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Color(0xFFD1D5DB),
                          width: 1.1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: Color(0xFF26B7AB),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // 3. Login Button (Active Button -> Navigates to Dashboard)
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E1B4B),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
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

/// صفحة واجهة Login_Component 3 مع خلفية بيضاء بالكامل
class LoginComponent3View extends StatelessWidget {
  final VoidCallback? onLoginSuccess;

  const LoginComponent3View({
    super.key,
    this.onLoginSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء كاملة كما في التصميم والطلب
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: LoginComponent3(
              onLoginSuccess: () {
                onLoginSuccess?.call();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const DashboardView()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
