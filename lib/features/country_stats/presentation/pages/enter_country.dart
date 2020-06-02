import 'package:covid_19_map/features/country_stats/presentation/bloc/country_stats_bloc.dart';
import 'package:covid_19_map/features/country_stats/presentation/pages/stats_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterCountry extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  @override
  _EnterCountryState createState() => _EnterCountryState();
}

class _EnterCountryState extends State<EnterCountry> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          backgroundColor: Colors.lightBlue[700],
          centerTitle: true,
          primary: true,
          title: new Text("COVID-19 Stats")),
      body: BlocListener<CountryStatsBloc, CountryStatsState>(
        listener: (context, state) {
          if (state is CountryStatsSuccess) {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => StatsPage(
                      countryStats: state.countryStats,
                      countryName: widget.controller.text,
                    )));
          } else if (state is CountryStatsFailed) {
            _scaffoldKey.currentState
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text("An error occured."),
              ));
          }
        },
        child: BlocBuilder<CountryStatsBloc, CountryStatsState>(
          builder: (context, state) {
            if (state is CountryStatsInProgress)
              return Center(child: CircularProgressIndicator());
            else
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter country name",
                      style: TextStyle(color: Colors.cyanAccent, fontSize: 25),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        controller: widget.controller,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      color: Colors.lightGreen,
                      child: new Text(
                        "Get Stats",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      onPressed: () {
                        BlocProvider.of<CountryStatsBloc>(context)
                            .add(CountryStatsRequested(widget.controller.text));
                      },
                    ),
                  ]);
          },
        ),
      ),
    );
  }
}
