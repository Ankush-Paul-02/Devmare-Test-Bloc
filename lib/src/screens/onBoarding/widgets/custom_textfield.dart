import 'package:flutter/material.dart';
import '../../../constants/colors.dart';


class CustomTextField extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;

  const CustomTextField({super.key, required this.hint, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: white,
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
