// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void _configureCountryStatsFactories() {
    final Container container = Container();
    container.registerFactory(
        (c) => CountryStatsBloc(getCountryStats: c<GetCountryStats>()));
    container.registerFactory(
        (c) => GetCountryStats(repository: c<CountryStatsRepository>()));
    container
        .registerFactory<CountryStatsRepository, CountryStatsRepositoryImpl>(
            (c) => CountryStatsRepositoryImpl(client: c<Client>()));
    container.registerFactory((c) => Client());
  }
}
