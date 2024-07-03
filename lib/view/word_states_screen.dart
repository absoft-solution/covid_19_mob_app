import 'package:covid_19_mob_app/Model/world_states_model.dart';
import 'package:covid_19_mob_app/Services/state_services.dart';
import 'package:covid_19_mob_app/constant/const_common_colors.dart';
import 'package:covid_19_mob_app/view/country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../componets/row_comonent.dart';

class WordStatesScreen extends StatefulWidget {
  const WordStatesScreen({super.key});

  @override
  State<WordStatesScreen> createState() => _WordStatesScreenState();
}

class _WordStatesScreenState extends State<WordStatesScreen> {
  StateServices stateServices = StateServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text("COVID-19 Tracker"),
      // ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder(
              future: stateServices.fetchWorldStatesApi(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Column(
                    children: [
                      SizedBox(height: 80),
                      PieChart(
                        dataMap: {
                          'Total': double.parse(snapshot.data!.cases.toString()),
                          'Recovered': double.parse(snapshot.data!.recovered.toString()),
                          'Death': double.parse(snapshot.data!.deaths.toString()),
                        },
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 2.7,
                        colorList: commonColors,
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 32,
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.left,
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
                            ReusableRow(title: "Total Cases", value: snapshot.data!.cases.toString()),
                            Divider(color: Colors.grey),
                            ReusableRow(title: "Recovered", value: snapshot.data!.recovered.toString()),
                            Divider(color: Colors.grey),
                            ReusableRow(title: "Deaths", value: snapshot.data!.deaths.toString()),
                            Divider(color: Colors.grey),
                            ReusableRow(title: "Today Recorded", value: snapshot.data!.todayRecovered.toString()),
                            Divider(color: Colors.grey),
                            ReusableRow(title: "Population", value: snapshot.data!.population.toString()),
                            Divider(color: Colors.grey),
                            ReusableRow(title: "Critical", value: snapshot.data!.critical.toString()),
                            Divider(color: Colors.grey),
                            ReusableRow(title: "Affected Countries", value: snapshot.data!.affectedCountries.toString()),
                          ]
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryDetailScreen()));
                        },
                        child: Text(
                          "Track Countries",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
