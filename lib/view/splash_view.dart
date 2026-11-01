import 'dart:async';
import 'package:flutter/material.dart';
import 'widgets/afwi_logo.dart';
import 'widgets/decorative_squares.dart';
import 'welcome_view.dart';

class SplashView extends StatefulWidget {
  final VoidCallback? onContinue;

  const SplashView({
    super.key,
    this.onContinue,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // الانتقال التلقائي بعد 2.5 ثانية إلى واجهة الترحيب (Welcome)
    _timer = Timer(const Duration(milliseconds: 2500), () {
      _proceed();
    });
  }

  void _proceed() {
    if (!mounted) return;
    if (widget.onContinue != null) {
      widget.onContinue!();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeView()),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          _timer?.cancel();
          _proceed();
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Stack(
          children: [
            // Decorative background squares - bottom left
            const Positioned(
              left: 20,
              bottom: 20,
              child: DecorativeSquares(scale: 1.1),
            ),

            // Decorative background squares - top right
            const Positioned(
              right: 40,
              top: 20,
              child: RotatedBox(
                quarterTurns: 2,
                child: DecorativeSquares(scale: 0.9),
              ),
            ),

            // Stylized faint "A" watermark in center/right
            Positioned.fill(
              child: Align(
                alignment: const Alignment(0.45, 0.0),
                child: CustomPaint(
                  size: const Size(420, 480),
                  painter: _LetterAWatermarkPainter(),
                ),
              ),
            ),

            // Center AFWI Official Logo
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AfwiLogo(width: 280),
                  const SizedBox(height: 32),
                  const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF26B7AB)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'جاري التحميل... (أو انقر للمتابعة)',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LetterAWatermarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC7D2FE).withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.48, h * 0.05);
    path.lineTo(w * 0.82, h * 0.88);
    path.lineTo(w * 0.65, h * 0.88);
    path.lineTo(w * 0.58, h * 0.68);
    path.lineTo(w * 0.32, h * 0.68);
    path.lineTo(w * 0.22, h * 0.88);
    path.lineTo(w * 0.05, h * 0.88);
    path.close();

    final innerPath = Path();
    innerPath.moveTo(w * 0.46, h * 0.26);
    innerPath.lineTo(w * 0.53, h * 0.52);
    innerPath.lineTo(w * 0.38, h * 0.52);
    innerPath.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(innerPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
