import 'package:flutter/material.dart';

import '../../widgets/default_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(titleText: 'Luga Admin Home'),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: const Center(
          child: Text('welcome to home...'),
        ),
      ),
    );
  }
}
