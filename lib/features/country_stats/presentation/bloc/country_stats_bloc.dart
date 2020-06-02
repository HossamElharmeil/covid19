import 'dart:async';

import 'package:covid_19_map/core/failures.dart';
import 'package:covid_19_map/features/country_stats/domain/entities/country_stats.dart';
import 'package:covid_19_map/features/country_stats/domain/usecases/get_country_stats.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'country_stats_event.dart';
part 'country_stats_state.dart';

class CountryStatsBloc extends Bloc<CountryStatsEvent, CountryStatsState> {
  final GetCountryStats _getCountryStats;

  CountryStatsBloc({@required GetCountryStats getCountryStats})
      : assert(getCountryStats != null),
        _getCountryStats = getCountryStats;

  @override
  CountryStatsState get initialState => CountryStatsInitial();

  @override
  Stream<CountryStatsState> mapEventToState(
    CountryStatsEvent event,
  ) async* {
    if (event is CountryStatsRequested) {
      yield* _mapCountryStatsRequestedToState(event.countryName);
    }
  }

  Stream<CountryStatsState> _mapCountryStatsRequestedToState(
      String countryName) async* {
    yield CountryStatsInProgress();
    final countryStatsEither = await _getCountryStats(countryName);
    yield* countryStatsEither.fold((failure) async* {
      if (failure is CountryStatsFailure)
        yield CountryStatsFailed(failure.message);
    }, (countryStats) async* {
      yield CountryStatsSuccess(countryStats);
    });
  }
}
