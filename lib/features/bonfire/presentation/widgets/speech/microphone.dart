import 'package:bonfire_app/features/bonfire/presentation/widgets/render_svg.dart';
import 'package:bonfire_app/res/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../res/colors.dart';
import '../../../provider/speech_provider.dart';

class MicrophoneWidget extends ConsumerWidget {
  const MicrophoneWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speechState = ref.watch(speechProvider);
    final speechNotifier = ref.read(speechProvider.notifier);
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(width: 2.2, color: BonfireColors.primaryColor)),
          child: RenderSvg(
            svgPath: BonfireImages.microphone_svg,
            svgHeight: 20,
            svgWidth: 20,
            useSvgColor: true,
          ),
        ),
        onTap: () async {
          if (!speechState.available) {
            await speechNotifier.initSpeech();
          }
          if (speechState.isListening) {
            await speechNotifier.stopListening();
          } else {
            await speechNotifier.startListening();
          }
        },
      ),
    );
  }
}
