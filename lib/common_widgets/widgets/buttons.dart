import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
        ),
        child: child,
      ),
    );
  }
}
