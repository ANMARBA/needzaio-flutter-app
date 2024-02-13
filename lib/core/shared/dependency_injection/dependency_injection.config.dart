// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_needzaio_app/core/shared/dependency_injection/dependency_injection.dart'
    as _i9;
import 'package:flutter_needzaio_app/features/home/domain/usecases/add_boarding_pass_use_case.dart'
    as _i7;
import 'package:flutter_needzaio_app/features/home/domain/usecases/get_boarding_pass_use_case.dart'
    as _i8;
import 'package:flutter_needzaio_app/features/home/home.dart' as _i5;
import 'package:flutter_needzaio_app/features/home/infrastructure/data/datasources/home_remote_service.dart'
    as _i4;
import 'package:flutter_needzaio_app/features/home/infrastructure/data/repositories/home_repository_impl.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.GraphQLClient>(() => injectableModule.client);
    gh.factory<_i4.HomeRemoteService>(
        () => _i4.HomeRemoteServiceImpl(gh<_i3.GraphQLClient>()));
    gh.factory<_i5.HomeRepository>(
        () => _i6.HomeRepositoryImpl(gh<_i5.HomeRemoteService>()));
    gh.factory<_i7.AddBoardingPassUseCase>(
        () => _i7.AddBoardingPassUseCase(gh<_i5.HomeRepository>()));
    gh.factory<_i8.GetBoardingPassUseCase>(
        () => _i8.GetBoardingPassUseCase(gh<_i5.HomeRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i9.InjectableModule {}
