import 'package:covid_19_map/core/failures.dart';
import 'package:covid_19_map/features/country_stats/domain/entities/country_stats.dart';
import 'package:dartz/dartz.dart';

abstract class CountryStatsRepository {
  Future<Either<Failure, String>> getConfirmed(String countryName);
  Future<Either<Failure, String>> getDeath(String countryName);
  Future<Either<Failure, String>> getRecovered(String countryName);
  Future<Either<Failure, CountryStats>> getCountryStats(String countryName);
}
