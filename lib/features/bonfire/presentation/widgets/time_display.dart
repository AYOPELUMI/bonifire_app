import 'package:bonfire_app/features/bonfire/presentation/widgets/render_svg.dart';
import 'package:bonfire_app/res/gap.dart';
import 'package:bonfire_app/res/images.dart';
import 'package:flutter/material.dart';

class TimeDisplay extends StatelessWidget {
  final String timeAgo;
  final int likes;

  const TimeDisplay({
    super.key,
    required this.timeAgo,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RenderSvg(
          svgPath: BonfireImages.clock_svg,
          svgHeight: 15,
          useSvgColor: true,
        ),
        Text(
          '${timeAgo.split(" ").first}h ${timeAgo.split(" ").last}m',
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "ProximaNova Bold"),
        ),
        10.horizontalSpacing,
        RenderSvg(
          svgPath: BonfireImages.profile_white_svg,
          svgHeight: 15,
          useSvgColor: true,
        ),
        Text(
          likes.toString(),
          style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "ProximaNova Bold"),
        ),
      ],
    );
  }
}
