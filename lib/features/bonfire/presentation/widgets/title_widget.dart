import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFFCCC8FF),
        fontFamily: 'ProximaNova',
        fontWeight: FontWeight.w700,
        fontSize: 34,
        height: 1.0,
        letterSpacing: 0,
        shadows: [
          // First shadow (0px 0px 7.9px #00000033)
          Shadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 7.9,
            offset: const Offset(0, 0),
          ),
          // Second shadow (0px 0px 2px #BEBEBE)
          Shadow(
            color: const Color(0xFFBEBEBE),
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
          // Third shadow (0px 1px 2px #24232F80)
          Shadow(
            color: const Color(0xFF24232F).withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
    );
  }
}
