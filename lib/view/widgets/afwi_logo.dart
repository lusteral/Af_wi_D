import 'package:flutter/material.dart';

class AfwiLogo extends StatelessWidget {
  final double width;
  final double? height;

  const AfwiLogo({
    super.key,
    this.width = 150,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/afwi_logo.png',
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height ?? 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFCBD5E1)),
          ),
          child: const Text(
            'AFWI Logo',
            style: TextStyle(
              color: Color(0xFF1E1B4B),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }
}
