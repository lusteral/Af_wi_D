import 'package:flutter/material.dart';
import 'login_component.dart';

class WelcomeView extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback? onSkip;

  const WelcomeView({
    super.key,
    this.onNext,
    this.onSkip,
  });

  void _navigateToLogin(BuildContext context) {
    if (onNext != null) {
      onNext!();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginComponent3View()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left side: Empty placeholder for teacher image
          Expanded(
            flex: 5,
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFE2E8F0),
                  width: 1.5,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 72,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'مكان صورة الترحيب',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right side: Welcome Card and Navigation
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 36),
              child: Column(
                children: [
                  // Top Skip button (Active Button -> Navigates to Login)
                  Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (onSkip != null) {
                            onSkip!();
                          } else {
                            _navigateToLogin(context);
                          }
                        },
                        borderRadius: BorderRadius.circular(16),
                        hoverColor: const Color(0xFF312E81),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1B4B),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1E1B4B)
                                    .withValues(alpha: 0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 2),

                  // Title & Subtitle
                  const Text(
                    'Welcome to AFWI\nTeacher\'s app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1E1B4B),
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Subtext in Cyan/Teal
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 380),
                    child: const Text(
                      'Welcome to AFWI Teacher\'s app Welcome to AFWI\nTeacher\'s app Welcome to AFWI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Color(0xFF26B7AB),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

                  // Carousel indicator dots: · ── ·
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _indicatorDot(isActive: false),
                      const SizedBox(width: 6),
                      _indicatorDot(isActive: true),
                      const SizedBox(width: 6),
                      _indicatorDot(isActive: false),
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Next Button (Active Button -> Navigates to Login)
                  SizedBox(
                    width: 260,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => _navigateToLogin(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E1B4B),
                        foregroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isActive ? 22 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF26B7AB) : const Color(0xFFCBD5E1),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
