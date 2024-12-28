import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.usePrimaryClr = true,
  });
  final String text;
  final VoidCallback onTap;
  final bool usePrimaryClr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(top: 5),
        height: 50,
        decoration: BoxDecoration(
          color:
              usePrimaryClr ? context.theme.colorScheme.primary : backgroundClr,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: usePrimaryClr ? primaryClr : textClr,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 5,
              color: Colors.black12,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: usePrimaryClr ? backgroundClr : textClr,
            ),
          ),
        ),
      ),
    );
  }
}
