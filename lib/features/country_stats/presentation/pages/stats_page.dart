import 'package:covid_19_map/features/country_stats/domain/entities/country_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  final String countryName;
  final CountryStats countryStats;

  const StatsPage({Key key, this.countryName, this.countryStats})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.lightBlue[700],
            centerTitle: true,
            primary: true,
            title: new Text(countryName)),
        body: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Confirmed", style: TextStyle(color: Colors.cyanAccent, fontSize: 26,)),
              SizedBox(height: 12,),
              Text(countryStats.getConfirmed.toString(), style: TextStyle(color: Colors.white, fontSize: 32)),
              SizedBox(height: 35),
              Text("Deaths", style: TextStyle(color: Colors.cyanAccent, fontSize: 26)),
              SizedBox(height: 12),
              Text(countryStats.getDeaths.toString(), style: TextStyle(color: Colors.deepOrange, fontSize: 32)),
              SizedBox(height: 35),
              Text("Recovered", style: TextStyle(color: Colors.cyanAccent, fontSize: 26)),
              SizedBox(height: 12),
              Text(countryStats.getRecovered.toString(), style: TextStyle(color: Colors.lightGreen, fontSize: 32)),
              SizedBox(height: 35),
            ],
          ),
        ));
  }
}
