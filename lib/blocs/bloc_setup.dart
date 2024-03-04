import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/account/api_account_api.dart';
import '../api/http_api.dart';
import '../env/base_config.dart';

class BlocMainWrapper extends StatelessWidget {
  final BaseConfig config;

  final Widget child;

  const BlocMainWrapper({
    super.key,
    required this.child,
    required this.config,
  });
  @override
  Widget build(BuildContext context) {
    final HttpApi api = HttpApi(config.useSsl, config.baseApiUrl);
    return MultiRepositoryProvider(
      providers: <RepositoryProvider>[
        RepositoryProvider<BaseConfig>(
          create: (context) => config,
        ),
        RepositoryProvider<BaseAccountApi>(
          create: (context) => AccountApi(api: api),
        ),

        //add other api repos here...
      ],
      child: MultiBlocProvider(
        providers: const <BlocProvider>[
          //add blocs here..
        ],
        child: child,
      ),
    );
  }
}
