import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF000000).withOpacity(0.4),
            const Color(0xFF000000).withOpacity(0.123359),
            const Color(0xFF000000).withOpacity(0.0),
          ],
          stops: const [0.0, 0.14, 0.234],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0.0, -0.625),
            radius: 0.5,
            colors: [
              const Color(0xFF000000).withOpacity(0.045),
              const Color(0xFF000000).withOpacity(0.107193),
              const Color(0xFF000000).withOpacity(0.135),
              const Color(0xFF000000).withOpacity(0.195),
              const Color(0xFF000000).withOpacity(0.24),
            ],
            stops: const [0.0, 0.6328, 0.7566, 0.8844, 1.0],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF0F1115).withOpacity(0.0),
                const Color(0xFF0D0E12).withOpacity(0.28),
                const Color(0xFF0B0C0F).withOpacity(0.64),
                const Color(0xFF090B0D).withOpacity(0.8),
                const Color(0xFF000000),
              ],
              stops: const [0.4397, 0.486, 0.5252, 0.5514, 0.5694],
            ),
          ),
        ),
      ),
    );
  }
}