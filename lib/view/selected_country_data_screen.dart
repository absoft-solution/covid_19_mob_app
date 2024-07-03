// Ensure this path is correct
import 'package:flutter/material.dart';

import '../componets/row_comonent.dart';

class SelectedCountryDataScreen extends StatefulWidget {
  final String image;
  final String name;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  SelectedCountryDataScreen({
    super.key,
    required this.image,
    required this.name,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.test,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  @override
  State<SelectedCountryDataScreen> createState() =>
      _SelectedCountryDataScreenState();
}

class _SelectedCountryDataScreenState extends State<SelectedCountryDataScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text("Country Details"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(widget.image),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: [
                            ReusableRow(
                              title: 'Country Name',
                              value: widget.name,
                            ),
                            ReusableRow(
                              title: 'Total Deaths',
                              value: widget.totalDeaths.toString(),
                            ),
                            ReusableRow(
                              title: 'Total Cases',
                              value: widget.totalCases.toString(),
                            ),
                            ReusableRow(
                              title: 'Test',
                              value: widget.test.toString(),
                            ),
                            ReusableRow(
                              title: 'Critical',
                              value: widget.critical.toString(),
                            ),
                            ReusableRow(
                              title: 'Today Recovered',
                              value: widget.todayRecovered.toString(),
                            ),
                            ReusableRow(
                              title: 'Active',
                              value: widget.active.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
