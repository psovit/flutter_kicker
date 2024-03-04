import 'base_config.dart';

class DevConfig extends BaseConfig {
  @override
  String get baseApiUrl => 'localhost:8000';

  @override
  bool get useSsl => false;
}
