import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures.dart';
import '../entities/country_stats.dart';
import '../repositories/country_stats_repository.dart';

class GetCountryStats {
  CountryStatsRepository repository;

  GetCountryStats({@required this.repository});

  Future<Either<Failure, CountryStats>> call(String country) {
    return repository.getCountryStats(country);
  }
}
