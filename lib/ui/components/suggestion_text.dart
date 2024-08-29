import 'package:flutter/material.dart';

class SuggestionText extends StatelessWidget {
  final color;
  final String suggestionText;
  const SuggestionText(
      {super.key, required this.suggestionText, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Text(
      suggestionText,
      style: TextStyle(
        color: color,
        fontSize: 12,
        
      ),
    );
  }
}
