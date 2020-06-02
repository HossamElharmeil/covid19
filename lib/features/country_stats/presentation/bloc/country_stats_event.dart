part of 'country_stats_bloc.dart';

abstract class CountryStatsEvent extends Equatable {
  const CountryStatsEvent();
}

class CountryStatsRequested extends CountryStatsEvent {
  final String countryName;

  CountryStatsRequested(this.countryName);
  @override
  List<Object> get props => [countryName];
}
