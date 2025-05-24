import 'package:bonfire_app/res/colors.dart';
import 'package:bonfire_app/res/gap.dart';
import 'package:bonfire_app/res/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoCard extends ConsumerWidget {
  final String userName;
  final int userAge;
  final String question;
  final String userAnswer;

  const UserInfoCard({
    super.key,
    required this.userName,
    required this.userAge,
    required this.question,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image.asset(
                BonfireImages.profile_picture,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            16.horizontalSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$userName, $userAge',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: BonfireColors.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova "),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    question,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        height: 0.9,
                        color: BonfireColors.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "ProximaNova "),
                  ),
                ],
              ),
            ),
          ],
        ),
        9.verticalSpacing,
        Text(
          '"${userAnswer}"',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: BonfireColors.primaryColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              height: 0.5,
              fontSize: 12,
              fontFamily: "ProximaNova "),
        ),
      ],
    );
  }
}
