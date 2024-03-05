import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SsoButton extends StatelessWidget {
  final String imagePath;
  final String signInLabel;
  final void Function() onTap;

  const SsoButton({
    super.key,
    required this.signInLabel,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 60),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 0.45),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              imagePath,
            ),
            Text(signInLabel)
          ],
        ),
      ),
    );
  }
}
