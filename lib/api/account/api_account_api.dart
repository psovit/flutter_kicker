import 'package:flutter_kicker/api/http_api.dart';

import '../../models/account.dart';

abstract class BaseAccountApi {
  Future<Account?> load();
}

class AccountApi implements BaseAccountApi {
  final HttpApi _api;

  AccountApi({required HttpApi api}) : _api = api;
  @override
  Future<Account?> load() {
    // TODO: implement load
    throw UnimplementedError();
  }
}
