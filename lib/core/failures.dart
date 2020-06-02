abstract class Failure {}

class CountryStatsFailure implements Failure {
  String message;

  CountryStatsFailure(this.message);
}
