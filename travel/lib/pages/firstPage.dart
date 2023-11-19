import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:travel/models/Flight.dart';
import '../Services/api.dart';
import '../widgets/card.dart';
import '../widgets/search.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isLoading = false;
  bool isSuccessful = true;
  List<Flight> _flights = [];
  List<Flight> _flightsKepper = [];

  _getCurrentLocation() async {
    final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
    LocationPermission permission = await geolocator.requestPermission();

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await geolocator.getCurrentPosition();
      setState(() {
        location = true;
      });
      print(position);

      fetchData(position.latitude, position.longitude);
    } else {
      fetchData(32.109333, 34.855499);
    }
  }

  Future<void> fetchData(latitude, longitude) async {
    try {
      isLoading = true;

      //call the api
      var response = await GetdataApi().GetlistFlights(latitude, longitude);
      if (response == null) {

        setState(() {
        isLoading = false;
        isSuccessful = false;
        });

        return;
      }
      isSuccessful = true;
      setState(() {
        _flightsKepper = response;
        _flights = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
      isLoading = false;
      isSuccessful = false;
      });

      print("'4444' + $e");
    }
  }

  // function get the text from search;
  void handleTextSubmitted(String text) {
    print(text);
    final serchList = _flightsKepper
        .where((flight) =>
            flight.flight.toLowerCase().contains(text.toLowerCase()))
        .toList();

    setState(() {
      _flights = serchList;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  bool location = false;
  late Flight a;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/Animation.json',
                width: double.infinity,
              ),
            ]),
      );
    } else if (!isSuccessful) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0), // Adjust the margin as needed
          child: Text("some error occurred ):"),
        ),
      );
    }

    return Column(
      children: [
        if (location)
          Container(
            margin: const EdgeInsets.fromLTRB(3, 12, 3, 15),
            child: search(onTextSubmitted: handleTextSubmitted),
          ),
        if (!location)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'לחץ כאן כדי לקבל את כל המטוסים סביבך',
                style: TextStyle(fontSize: 18),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _getCurrentLocation();
                    },
                    child: const Text('לחץ כאן'),
                  ),
                ),
              ),
            ],
          ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height - 60,
          child: ListView.builder(
            // controller: _scrollController,
            scrollDirection: Axis.vertical,
            itemCount: _flights.length,
            itemBuilder: (context, index) {
              final flight = _flights[index];

              // Check the condition before creating the CustomCard
              if (flight.airline != "") {
                return CustomCard(
                  flight: flight,
                );
              } else {
                // If the condition is not met,
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }

  // development() async {
  //   String jsonString = await rootBundle.loadString('data.json');

  //   List<dynamic> jsonList = await jsonDecode(jsonString);

  //   // Create a list of Flight objects
  //   List<Flight> flightList =
  //       jsonList.map((json) => Flight.fromJson(json)).toList();

  //   _flights = flightList;

  //   setState(() {
  //    _flightsKepper=flightList;
  //     _flights;
  //   });
  // }
}
