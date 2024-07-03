import 'package:covid_19_mob_app/Services/state_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryDetailScreen extends StatefulWidget {
  const CountryDetailScreen({super.key});

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  StateServices stateServices = StateServices();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "Search Country",
                hintStyle: TextStyle(color: Colors.white),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: stateServices.fetchCountriesListApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade300,
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                          title: Container(
                            height: 10,
                            width: 89,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            height: 10,
                            width: 89,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}',
                          style: TextStyle(color: Colors.white)));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(
                      child: Text('No data available',
                          style: TextStyle(color: Colors.white)));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]['country'];
                      var country = snapshot.data![index];
                      if (searchController.text.isEmpty) {
                        return InkWell(
                          onTap: () {},
                          child: ListTile(
                            leading: Image.network(
                              country["countryInfo"]["flag"],
                              height: 50,
                              width: 50,
                            ),
                            subtitle: Text(country['cases'].toString(),
                                style: TextStyle(color: Colors.white)),
                            title: Text(country["country"],
                                style: TextStyle(color: Colors.white)),
                          ),
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return ListTile(
                          leading: Image.network(
                            country["countryInfo"]["flag"],
                            height: 50,
                            width: 50,
                          ),
                          subtitle: Text(country['cases'].toString(),
                              style: TextStyle(color: Colors.white)),
                          title: Text(country["country"],
                              style: TextStyle(color: Colors.white)),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
