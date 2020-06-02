import 'package:covid_19_map/features/country_stats/data/repositories/country_stats_repository_impl.dart';
import 'package:covid_19_map/features/country_stats/domain/repositories/country_stats_repository.dart';
import 'package:covid_19_map/features/country_stats/presentation/bloc/country_stats_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:http/http.dart';

import 'features/country_stats/domain/usecases/get_country_stats.dart';
part 'injector.g.dart';

abstract class Injector {
  static Container container;

  static void setup() {
    container = Container();
    _$Injector()._configure();
  }

  void _configure() {
    _configureCountryStatsModule();
  }

  //! CountryStats
  void _configureCountryStatsModule() {
    _configureCountryStatsInstances();
    _configureCountryStatsFactories();
  }

  void _configureCountryStatsInstances() {
    // container.registerInstance();
  }

  @Register.factory(CountryStatsBloc)
  @Register.factory(GetCountryStats)
  @Register.factory(CountryStatsRepository, from: CountryStatsRepositoryImpl)
  @Register.factory(Client)
  void _configureCountryStatsFactories();
}
