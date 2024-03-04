import 'base_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';

const String dev = 'DEV';
const String prod = 'PROD';

BaseConfig getConfig(String environment) {
  switch (environment) {
    case prod:
      return ProdConfig();

    default:
      return DevConfig();
  }
}
