import 'package:flutter/material.dart';

class RoundButtons extends StatelessWidget {
  String title;
  VoidCallback onPressed;
  bool loading;
  RoundButtons({super.key, required this.title, required this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: loading ? const CircularProgressIndicator():Text(title),
      ),
    );
  }
}
