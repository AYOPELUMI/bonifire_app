import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/bonfire.dart';

class BonfireNotifier extends StateNotifier<BonfireData> {
  BonfireNotifier() : super(_mockData);

  static final _mockData = BonfireData(
    userName: "Angelina",
    userAge: 28,
    question: "What is your favorite time of the day?",
    userAnswer: "Mine is definitely the peace in the morning.",
    likes: 103,
    timeAgo: "22h 00m",
    options: [
      Option(text: "The peace in the early mornings", option: "A"),
      Option(text: "The magical golden hours", option: "B"),
      Option(text: "Wind-down time after dinners", option: "C"),
      Option(text: "The serenity past midnight", option: "D"),
    ],
  );

  void toggleOption(int index) {
    final updatedOptions = state.options.asMap().entries.map((entry) {
      return entry.key == index
          ? entry.value.copyWith(isSelected: !entry.value.isSelected)
          : entry.value.copyWith(isSelected: false);
    }).toList();

    state = BonfireData(
      userName: state.userName,
      userAge: state.userAge,
      question: state.question,
      userAnswer: state.userAnswer,
      likes: state.likes,
      timeAgo: state.timeAgo,
      options: updatedOptions,
    );
  }
}

final bonfireProvider = StateNotifierProvider<BonfireNotifier, BonfireData>(
  (ref) => BonfireNotifier(),
);
