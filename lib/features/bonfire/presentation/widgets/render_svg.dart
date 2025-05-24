import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//a reusable widget to render svg which would help to in optimzing and reducing app size   rather than images
class RenderSvg extends StatelessWidget {
  final String svgPath;
  final double? svgHeight;
  final double? svgWidth;
  final Color? color;
  final bool useSvgColor;
  const RenderSvg(
      {super.key,
      required this.svgPath,
      this.svgHeight,
      this.svgWidth,
      this.useSvgColor = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: svgHeight ?? 24,
      width: svgWidth ?? 24,
      child: SvgPicture.asset(
        svgPath,
        fit: BoxFit.contain,
        height: svgHeight ?? 24,
        width: svgWidth ?? 24,
        // color: color ?? Theme.of(context).iconTheme.color,
        colorFilter: useSvgColor
            ? null
            : ColorFilter.mode(
                color ?? Theme.of(context).iconTheme.color!, BlendMode.srcIn),
      ),
    );
  }
}
