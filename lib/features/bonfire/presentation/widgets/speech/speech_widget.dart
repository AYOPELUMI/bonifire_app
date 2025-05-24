import 'package:bonfire_app/features/bonfire/presentation/widgets/button_widget.dart';
import 'package:bonfire_app/res/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../res/colors.dart';
import '../../../provider/speech_provider.dart';
import 'microphone.dart';

class SpeechWidget extends ConsumerWidget {
  const SpeechWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speechState = ref.watch(speechProvider);
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontFamily: "ProximaNova",
        color: BonfireColors.secTextColor,
        fontSize: 12);
    return Row(
      children: [
        if (speechState.isListening ||
            speechState.recognizedText.isNotEmpty) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"${speechState.recognizedText}"',
                  style: style,
                ),
                if (speechState.isListening) LinearProgressIndicator(),
              ],
            ),
          ),
        ] else ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pick your option.',
                  style: style,
                ),
                Text(
                  'See who has a similar mind.',
                  style: style,
                ),
              ],
            ),
          ),
        ],
        12.horizontalSpacing,
        MicrophoneWidget(),
        6.horizontalSpacing,
        ButtonWidget()
      ],
    );
  }
}
