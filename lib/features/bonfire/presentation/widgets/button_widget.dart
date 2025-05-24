import 'package:bonfire_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonWidget extends ConsumerWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(2.5),
        decoration: BoxDecoration(
            color: BonfireColors.primaryColor,
            shape: BoxShape.circle,
            border: Border.all(width: 2.2, color: BonfireColors.primaryColor)),
        child: Icon(
          Icons.arrow_forward,
          size: 32,
        ),
      ),
      onTap: () async {},
    );
  }
}
