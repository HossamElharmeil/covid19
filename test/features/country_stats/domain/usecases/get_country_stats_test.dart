import 'package:covid_19_map/core/failures.dart';
import 'package:covid_19_map/features/country_stats/domain/entities/country_stats.dart';
import 'package:covid_19_map/features/country_stats/domain/repositories/country_stats_repository.dart';
import 'package:covid_19_map/features/country_stats/domain/usecases/get_country_stats.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCountryStatsRepository extends Mock
    implements CountryStatsRepository {}

void main() {
  CountryStatsRepository repository;
  GetCountryStats getCountryStats;
  CountryStats countryStats;
  String tCountry = "country";
  Failure failure;

  setUp(() {
    failure = CountryStatsFailure("Unable to fetch data");
    countryStats = CountryStats(confirmed: "200000", deaths: "50000", recovered: "80000");
    repository = MockCountryStatsRepository();
    getCountryStats = GetCountryStats(repository: repository);
  });

  test(
      'Should forward the call to the CountryStatsRepository when the usecase is called',
      () async {
    when(repository.getCountryStats(any))
        .thenAnswer((_) async => Right(countryStats));

    final result = await getCountryStats(tCountry);

    expect(result, Right(countryStats));
  });

  test(
      'Should return a left containing a failure when the repository returns a failure',
      () async {
    when(repository.getCountryStats(any))
        .thenAnswer((_) async => Left(failure));

    final result = await getCountryStats(tCountry);

    expect(result, Left(failure));
  });
}
