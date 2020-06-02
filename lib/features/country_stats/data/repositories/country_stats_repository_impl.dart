import 'dart:convert';

import 'package:covid_19_map/core/failures.dart';
import 'package:covid_19_map/features/country_stats/domain/entities/country_stats.dart';
import 'package:covid_19_map/features/country_stats/domain/repositories/country_stats_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CountryStatsRepositoryImpl implements CountryStatsRepository {
  final http.Client client;

  CountryStatsRepositoryImpl({@required this.client});
  @override
  Future<Either<Failure, String>> getConfirmed(String countryName) async {
    try {
      final response = await client.get(
          "https://covid1910.p.rapidapi.com/data/confirmed/country/$countryName",
          headers: {
            "X-RapidAPI-Key":
                "933408de88msh18534bbfd977feep1670aajsnb03769f8c778",
            "X-RapidAPI-Host": "covid1910.p.rapidapi.com"
          });
      return Right(json.decode(response.body)[0]["confirmed"].toString());
    } catch (_) {
      return Left(CountryStatsFailure("An error orccured."));
    }
  }

  @override
  Future<Either<Failure, CountryStats>> getCountryStats(
      String countryName) async {
    String confirmed;
    String recovered;
    String death;
    try {
      final confirmedEither = await getConfirmed(countryName);
      confirmedEither.fold((failure) {
        return Left(failure);
      }, (result) {
        confirmed = result;
      });
      final recoveredEither = await getRecovered(countryName);
      recoveredEither.fold((failure) {
        return Left(failure);
      }, (result) {
        recovered = result;
      });
      final deathEither = await getDeath(countryName);
      deathEither.fold((failure) {
        return Left(failure);
      }, (result) {
        death = result;
      });

      return Right(CountryStats(
          confirmed: confirmed, recovered: recovered, deaths: death));
    } catch (_) {
      return Left(CountryStatsFailure("An error occured"));
    }
  }

  @override
  Future<Either<Failure, String>> getDeath(String countryName) async {
    try {
      final response = await client.get(
          "https://covid1910.p.rapidapi.com/data/death/country/$countryName",
          headers: {
            "X-RapidAPI-Key":
                "933408de88msh18534bbfd977feep1670aajsnb03769f8c778",
            "X-RapidAPI-Host": "covid1910.p.rapidapi.com"
          });

      return Right(json.decode(response.body)[0]["death"].toString());
    } catch (_) {
      return Left(CountryStatsFailure("An error occured."));
    }
  }

  @override
  Future<Either<Failure, String>> getRecovered(String countryName) async {
    try {
      final response = await client.get(
          "https://covid1910.p.rapidapi.com/data/recovered/country/$countryName",
          headers: {
            "X-RapidAPI-Key":
                "933408de88msh18534bbfd977feep1670aajsnb03769f8c778",
            "X-RapidAPI-Host": "covid1910.p.rapidapi.com"
          });

      return Right(json.decode(response.body)[0]["recovered"].toString());
    } catch (_) {
      return Left(CountryStatsFailure("An error occured."));
    }
  }
}
