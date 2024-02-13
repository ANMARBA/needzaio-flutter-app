import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_needzaio_app/core/core.dart';

import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
configureDependencies() => getIt.init();

@module
abstract class InjectableModule {
  @lazySingleton
  GraphQLClient get client => GraphQLClientConfig().getClient();
}
