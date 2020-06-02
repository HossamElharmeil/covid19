import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CountryStats extends Equatable{
  final String _deaths;
  final String _confirmed;
  final String _recovered;

  get getConfirmed => _confirmed;
  get getRecovered => _recovered;
  get getDeaths => _deaths;

  CountryStats({@required String deaths, @required String confirmed, @required String recovered}):
  assert(deaths != null),
  assert(confirmed != null),
  assert(recovered != null),
  _confirmed = confirmed,
  _deaths = deaths,
  _recovered = recovered;

  @override
  List<Object> get props => [_deaths, _confirmed, _recovered];
}
