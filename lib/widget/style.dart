import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  final String text;
  const CenterText(this.text);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
      ),
    );
  }
}
