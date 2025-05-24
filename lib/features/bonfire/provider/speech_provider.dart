import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechNotifier extends StateNotifier<SpeechState> {
  final SpeechToText _speech = SpeechToText();

  SpeechNotifier() : super(SpeechState());

  Future<void> initSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        state = state.copyWith(status: status);
      },
      onError: (error) {
        state = state.copyWith(error: error.errorMsg);
      },
    );
    state = state.copyWith(available: available);
  }

  Future<void> startListening() async {
    if (!state.isListening) {
      state = state.copyWith(
        recognizedText: '',
        isListening: true,
      );
      await _speech.listen(
        onResult: (result) {
          state = state.copyWith(
            recognizedText: result.recognizedWords,
            isListening: !result.finalResult,
          );
        },
      );
    }
  }

  Future<void> stopListening() async {
    if (state.isListening) {
      await _speech.stop();
      state = state.copyWith(isListening: false);
    }
  }
}

final speechProvider = StateNotifierProvider<SpeechNotifier, SpeechState>(
  (ref) => SpeechNotifier(),
);

class SpeechState {
  final String recognizedText;
  final bool isListening;
  final bool available;
  final String? error;
  final String? status;

  SpeechState({
    this.recognizedText = '',
    this.isListening = false,
    this.available = false,
    this.error,
    this.status,
  });

  SpeechState copyWith({
    String? recognizedText,
    bool? isListening,
    bool? available,
    String? error,
    String? status,
  }) {
    return SpeechState(
      recognizedText: recognizedText ?? this.recognizedText,
      isListening: isListening ?? this.isListening,
      available: available ?? this.available,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}