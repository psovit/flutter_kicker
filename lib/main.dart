import 'package:flutter/material.dart';

import 'blocs/bloc_setup.dart';
import 'env/base_config.dart';
import 'env/env_gen.dart';
import 'utils/route_helper.dart';

void main() {
  const String environment = String.fromEnvironment(
    'ENV',
    defaultValue: dev,
  );
  WidgetsFlutterBinding.ensureInitialized();

  final BaseConfig config = getConfig(environment);

  runApp(MyApp(config: config));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.config,
  });
  final BaseConfig config;

  @override
  Widget build(BuildContext context) {
    final MaterialApp app = MaterialApp.router(
      builder: (BuildContext context, Widget? child) {
        var data = MediaQuery.of(context);
        return MediaQuery(data: data.copyWith(), child: child ?? Container());
      },
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routerConfig: RouteHelper.routes,
    );
    return BlocMainWrapper(
      config: config,
      child: app,
    );
  }
}
