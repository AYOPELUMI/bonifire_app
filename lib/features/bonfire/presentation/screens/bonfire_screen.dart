import 'package:auto_route/annotations.dart';
import 'package:bonfire_app/features/bonfire/presentation/widgets/gradient_bg.dart';
import 'package:bonfire_app/features/bonfire/presentation/widgets/render_svg.dart';
import 'package:bonfire_app/features/bonfire/presentation/widgets/speech/speech_widget.dart';
import 'package:bonfire_app/features/bonfire/presentation/widgets/time_display.dart';
import 'package:bonfire_app/features/bonfire/presentation/widgets/title_widget.dart';

import 'package:bonfire_app/res/gap.dart';
import 'package:bonfire_app/res/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/option_card.dart';
import '../widgets/user_info_card.dart';
import '../../provider/bonfire_provider.dart';

@RoutePage()
class BonfireScreen extends ConsumerWidget {
  const BonfireScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bonfireData = ref.watch(bonfireProvider);
    final notifier = ref.read(bonfireProvider.notifier);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: 3,
          selectedFontSize: 0,
          selectedIconTheme: IconThemeData(size: 24),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                // backgroundColor: Colors.red,
                icon: RenderSvg(
                  svgPath: BonfireImages.card_svg,
                  useSvgColor: true,
                ),
                label: ""),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: RenderSvg(
                  svgPath: BonfireImages.fire_svg,
                  useSvgColor: true,
                ),
                label: ""),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: RenderSvg(
                  svgPath: BonfireImages.message_svg,
                  useSvgColor: true,
                ),
                label: ""),
            BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: RenderSvg(
                  svgPath: BonfireImages.profile_svg,
                  useSvgColor: true,
                ),
                label: ""),
          ]),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GradientBackground(),
          Image.asset(
            BonfireImages.bg,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            color: Colors.white.withOpacity(0.5),
            colorBlendMode: BlendMode.modulate,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                36.verticalSpacing,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TitleWidget(
                          text: "Stroll Bonfire",
                        ),
                        10.horizontalSpacing,
                        RenderSvg(
                          svgPath: BonfireImages.dropdown_svg,
                          svgHeight: 24,
                          svgWidth: 18,
                          useSvgColor: true,
                        )
                      ],
                    ),
                    TimeDisplay(
                        timeAgo: bonfireData.timeAgo, likes: bonfireData.likes),
                  ],
                ),
                Spacer(),
                // User info card
                UserInfoCard(
                  userName: bonfireData.userName,
                  userAge: bonfireData.userAge,
                  question: bonfireData.question,
                  userAnswer: bonfireData.userAnswer,
                ),
                14.verticalSpacing,
                // Options
                GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 3,
                  children: bonfireData.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final option = entry.value;
                    return OptionCard(
                      text: option.text,
                      option: option.option,
                      isSelected: option.isSelected,
                      onTap: () => notifier.toggleOption(index),
                    );
                  }).toList(),
                ),
                11.verticalSpacing,
                SpeechWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
