import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const DefaultAppBar({super.key, required this.titleText});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
