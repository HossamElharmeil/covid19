import 'package:covid_19_map/features/country_stats/presentation/pages/enter_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/country_stats/presentation/bloc/country_stats_bloc.dart';
import 'injector.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Stats',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        dialogBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        primarySwatch: Colors.lightBlue,
      ),
      home: BlocProvider<CountryStatsBloc>(create: (context) => Injector.container.resolve<CountryStatsBloc>(), child: EnterCountry()),
    );
  }
}
