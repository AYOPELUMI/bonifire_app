class BonfireData {
  final String userName;
  final int userAge;
  final String question;
  final String userAnswer;
  final int likes;
  final String timeAgo;
  final List<Option> options;

  BonfireData({
    required this.userName,
    required this.userAge,
    required this.question,
    required this.userAnswer,
    required this.likes,
    required this.timeAgo,
    required this.options,
  });
}

class Option {
  final String text;
  final String option;
  final bool isSelected;

  Option({
    required this.text,
    required this.option,
    this.isSelected = false,
  });

  Option copyWith({
    String? text,
    String? option,
    bool? isSelected,
  }) {
    return Option(
      text: text ?? this.text,
      option: option ?? this.option,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
