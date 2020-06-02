part of 'country_stats_bloc.dart';

abstract class CountryStatsState extends Equatable {
  const CountryStatsState();
}

class CountryStatsInitial extends CountryStatsState {
  @override
  List<Object> get props => [];
}

class CountryStatsLoading extends CountryStatsState {
  @override
  List<Object> get props => [];
}

class CountryStatsSuccess extends CountryStatsState {
  final CountryStats countryStats;

  CountryStatsSuccess(this.countryStats);
  @override
  List<Object> get props => [countryStats];
}

class CountryStatsInProgress extends CountryStatsState {
  @override
  List<Object> get props => [];
}

class CountryStatsFailed extends CountryStatsState {
  final String error;

  CountryStatsFailed(this.error);
  @override
  List<Object> get props => [error];
}
