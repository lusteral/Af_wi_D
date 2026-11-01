import 'package:flutter/material.dart';

class DecorativeSquares extends StatelessWidget {
  final double scale;

  const DecorativeSquares({
    super.key,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140 * scale,
      height: 120 * scale,
      child: Stack(
        children: [
          // Large cyan square top-center
          Positioned(
            left: 45 * scale,
            top: 0,
            child: _box(
              width: 32 * scale,
              height: 44 * scale,
              color: const Color(0xFF67E8F9),
              radius: 6 * scale,
            ),
          ),
          // Small purple square top-left
          Positioned(
            left: 0,
            top: 34 * scale,
            child: _box(
              width: 12 * scale,
              height: 16 * scale,
              color: const Color(0xFFCBD5E1),
              radius: 3 * scale,
            ),
          ),
          // Teal square
          Positioned(
            left: 20 * scale,
            top: 66 * scale,
            child: _box(
              width: 16 * scale,
              height: 22 * scale,
              color: const Color(0xFF26B7AB),
              radius: 4 * scale,
            ),
          ),
          // Green square
          Positioned(
            left: 4 * scale,
            top: 92 * scale,
            child: _box(
              width: 10 * scale,
              height: 12 * scale,
              color: const Color(0xFF34D399),
              radius: 2 * scale,
            ),
          ),
          // Cyan medium
          Positioned(
            left: 50 * scale,
            top: 64 * scale,
            child: _box(
              width: 12 * scale,
              height: 16 * scale,
              color: const Color(0xFF67E8F9),
              radius: 3 * scale,
            ),
          ),
          // Lavender square
          Positioned(
            left: 44 * scale,
            top: 98 * scale,
            child: _box(
              width: 13 * scale,
              height: 16 * scale,
              color: const Color(0xFFA5B4FC),
              radius: 3 * scale,
            ),
          ),
          // Mint square
          Positioned(
            left: 72 * scale,
            top: 58 * scale,
            child: _box(
              width: 18 * scale,
              height: 24 * scale,
              color: const Color(0xFF6EE7B7),
              radius: 4 * scale,
            ),
          ),
          // Light cyan small
          Positioned(
            left: 70 * scale,
            top: 106 * scale,
            child: _box(
              width: 11 * scale,
              height: 14 * scale,
              color: const Color(0xFF67E8F9),
              radius: 3 * scale,
            ),
          ),
          // Right purple rectangle
          Positioned(
            left: 102 * scale,
            top: 80 * scale,
            child: _box(
              width: 18 * scale,
              height: 26 * scale,
              color: const Color(0xFFA5B4FC),
              radius: 4 * scale,
            ),
          ),
        ],
      ),
    );
  }

  Widget _box({
    required double width,
    required double height,
    required Color color,
    required double radius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: color, width: 1.5 * scale),
      ),
    );
  }
}
