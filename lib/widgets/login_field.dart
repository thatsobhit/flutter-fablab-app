import 'package:flutter/material.dart';
import 'package:fablabapp/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final IconData? customIcon;
  final Color? customIconColor;
  final TextEditingController controller; // Add the TextEditingController parameter

  const LoginField({
    Key? key,
    required this.hintText,
    this.customIcon,
    this.customIconColor,
    required this.controller, // Initialize the TextEditingController parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16), // Add horizontal padding
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: TextFormField(
          controller: controller, // Assign the provided controller to the TextFormField
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.gradient2,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
            prefixIcon: customIcon != null
                ? Icon(
              customIcon,
              color: customIconColor,
            )
                : null,
          ),
        ),
      ),
    );
  }
}
