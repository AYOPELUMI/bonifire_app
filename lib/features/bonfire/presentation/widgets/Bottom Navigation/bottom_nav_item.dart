import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../res/images.dart';
import '../render_svg.dart';

BottomNavigationBarItem bottomNavigationBarItem(
    {required String svgPath, required bool isNotified, String? value = ""}) {
  log(value ?? "");
  return BottomNavigationBarItem(
      backgroundColor: Colors.transparent,
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          RenderSvg(
            svgPath: svgPath,
            useSvgColor: true,
          ),
          if (isNotified)
            Positioned(
                right: -10,
                child: Container(
                    width: 16,
                    height: 13,
                    decoration: BoxDecoration(
                        color: Color(0xFFB5B2FF),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border:
                            Border.all(width: 1.4, color: Color(0xFF0F1115))),
                    child: value!.isNotEmpty
                        ? Text(
                            value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF0F1115),
                                fontSize: 7,
                                fontWeight: FontWeight.w600,
                                fontFamily: "ProximaNova"),
                          )
                        : null))
        ],
      ),
      label: "");
}
