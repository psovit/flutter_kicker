import 'package:flutter_kicker/env/base_config.dart';

class ProdConfig extends BaseConfig {
  @override
  String get baseApiUrl => '';

  @override
  bool get useSsl => true;
}
