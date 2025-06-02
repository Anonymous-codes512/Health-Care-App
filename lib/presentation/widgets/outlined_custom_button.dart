import 'package:flutter/material.dart';

class OutlinedCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? trailingIcon; // optional trailing icon

  const OutlinedCustomButton({
    required this.text,
    this.onPressed,
    this.trailingIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        minimumSize: const Size(double.infinity, 45),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          if (trailingIcon != null) trailingIcon!,
        ],
      ),
    );
  }
}
