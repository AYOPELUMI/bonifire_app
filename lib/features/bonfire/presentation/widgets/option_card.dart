import 'package:bonfire_app/res/colors.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String text;
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap,
      required this.option});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: BonfireColors.bgColor,
          border: Border.all(
            color: isSelected ? BonfireColors.primaryColor : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 21,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !isSelected
                    ? Colors.transparent
                    : BonfireColors.primaryColor,
                border: Border.all(
                  color:
                      isSelected ? Colors.transparent : BonfireColors.greyColor,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12,
                      height: 1.1,
                      color:
                          isSelected ? Colors.white : BonfireColors.greyColor),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 12, height: 1.1, color: BonfireColors.greyColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
