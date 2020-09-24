import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/config/styles.dart';
import 'package:covid_tracker/widgets/bar.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  const CovidBarChart({@required this.covidCases});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cases trend in past days',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Row(
              children: [
                SizedBox(width: 20,),
                Bar(covidCases[0], ""),
                SizedBox(width: 10,),
                Bar(covidCases[1], ""),
                SizedBox(width: 10,),
                Bar(covidCases[2], ""),
                SizedBox(width: 10,),
                Bar(covidCases[3], ""),
                SizedBox(width: 10,),
                Bar(covidCases[4], ""),
                SizedBox(width: 10,),
                Bar(covidCases[5], ""),
                SizedBox(width: 10,),
                Bar(covidCases[6], ""),
                SizedBox(width: 10,),
                Bar(covidCases[7], ""),
                SizedBox(width: 10,),
                Bar(covidCases[8], ""),
                SizedBox(width: 10,),
                Bar(covidCases[9], ""),
              ],
            )
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}
