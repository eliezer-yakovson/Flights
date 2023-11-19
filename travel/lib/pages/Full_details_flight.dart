import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel/Services/api.dart';
import 'package:travel/Services/localStore.dart';
import 'package:travel/models/FlightFullData.dart';

import '../models/Flight.dart';

class FullDetails extends StatefulWidget {
  const FullDetails({super.key});

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {
  late FlightFullData _flightFullData;
  bool isLoading = false;
  bool one = false;
  bool isSecssful = true;

  getFullData(String flight) async {
    one = true;
    isLoading = true;
    var response = (await GetdataApi().GetFullData(flight));
    if (response != null) _flightFullData = response;
    //development();
    setState(() {
      isLoading = false;
      isSecssful = true;
    });

    if (response == null) isSecssful = false;
  }

  // void test(String flight){
  //   GetdataApi().GetFullData(flight);
  // }

  Future<FlightFullData?> development() async {
    try {
      String jsonString = await rootBundle.loadString('fulldata.json');

      // Parse the JSON data
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      String firstKey = jsonData.keys.first;
      Map<String, dynamic> firstFlightData = jsonData[firstKey];
      var flightFullData = FlightFullData.fromJson(firstFlightData);

      return flightFullData;
    } catch (e) {
      print("Error loading and parsing JSON: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Flight flightInfo =
        ModalRoute.of(context)?.settings.arguments as Flight;
    if (!one) {
      getFullData(flightInfo.flight);
    }

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (!isSecssful) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0), // Adjust the margin as needed
          child: Text("some error occurred ):"),
        ),
      );
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Image
              // Image.asset(
              //   'image.jpg',
              //   height: 200,
              //   fit: BoxFit.cover,
              // ),
              Container(
                height: 100,
              ),
              // Airline and Aircraft Details Section
              _buildSection(
                title: 'פרטי חברת תעופה ומטוס',
                parameters: {
                  "שם חברת התעופה": _flightFullData.airline?.name,
                  "סוג המטוס": _flightFullData.aircraft?.type,
                  "תאריך יצור לפני ": _flightFullData.aircraft?.ff,
                  "תיאור המטוס": _flightFullData.aircraft?.desc,
                },
              ),

              // Flight Details Section
              _buildSection(
                title: 'פרטי הטיסה',
                parameters: {
                  "זמן הגעה מתוכנן": _flightFullData.flight?.arr_scheduled,
                  "מרחק": _flightFullData.flight?.distance,
                },
              ),

              // Departure Airport Details Section
              _buildSection(
                title: 'פרטי שדה התעופה של המראה',
                parameters: {
                  "שם השדה התעופה": _flightFullData.depAirport?.name,
                  "עיר": _flightFullData.depAirport?.city,
                  "אזור זמן": _flightFullData.depAirport?.timezone_name,
                },
              ),

              // Arrival Airport Details Section
              _buildSection(
                title: 'פרטי שדה התעופה של הנחיתה',
                parameters: {
                  "שם השדה התעופה": _flightFullData.arrAirport?.name,
                  "עיר": _flightFullData.arrAirport?.city,
                  "אזור זמן": _flightFullData.arrAirport?.timezone_name,
                },
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      LocalStore().AddFlight(flightInfo.flight, flightInfo);
                    },
                    child: const Text('שמור לצפייה בהמשך'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title, required Map<String, dynamic> parameters}) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: parameters.entries
                .map((entry) => Text('${entry.key}: ${entry.value ?? "N/A"}'))
                .toList(),
          ),
        ],
      ),
    );
  }
}
