import 'package:covid_19_mob_app/constant/const_common_colors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../componets/row_comonent.dart';


class WordStatesScreen extends StatefulWidget {
  const WordStatesScreen({super.key});

  @override
  State<WordStatesScreen> createState() => _WordStatesScreenState();
}

class _WordStatesScreenState extends State<WordStatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text("COVID-19 Tracker"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          SizedBox(height: 80,),
            PieChart(
              dataMap:const{
                'Total':20,
                'Recovered':300,
                'Death':200
              } ,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              colorList: commonColors,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              color: Colors.orange,
              child: Column(
                children: [
                  ReusableRow(title: "Total", value: "200"),
                  Divider(color: Colors.grey),
                  ReusableRow(title: "Total", value: "200"),
                  Divider(color: Colors.grey),
                  ReusableRow(title: "Total", value: "200"),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
              onPressed: () {
                // Add navigation logic here
              },
              child: Text(
                "Track Countries",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
