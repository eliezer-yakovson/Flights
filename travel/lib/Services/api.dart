import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel/models/Flight.dart';
import 'package:travel/models/FlightData.dart';
import 'package:travel/models/FlightFullData.dart';

class GetdataApi {
  Future<List<Flight>?> GetlistFlights(
      double latitude, double longitude) async {
    var url = Uri.parse(
        "https://flight-data4.p.rapidapi.com/get_area_flights?latitude=${latitude}&longitude=${longitude}");
    var headers = {
      "X-RapidAPI-Key": "3d1ec80e61mshb81a12ff98f38ffp1b087ajsn84bf9db7e573",
      "X-RapidAPI-Host": "flight-data4.p.rapidapi.com",
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var body = response.body;

      var flightData = FlightData.fromJson(body);

      List<Flight> flightList =
          flightData.flights.map((json) => Flight.fromJson(json)).toList();
      
      return flightList;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }

  Future<FlightFullData?> GetFullData(String flightId) async {
    var url = Uri.parse(
        "https://flight-data4.p.rapidapi.com/get_flight_info?flight=${flightId}");
    var headers = {
      "X-RapidAPI-Key": "3d1ec80e61mshb81a12ff98f38ffp1b087ajsn84bf9db7e573",
      "X-RapidAPI-Host": "flight-data4.p.rapidapi.com",
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var body = response.body;

      // Parse the JSON data
      Map<String, dynamic> jsonData = jsonDecode(body);

      String firstKey = jsonData.keys.first;
      Map<String, dynamic> firstFlightData = jsonData[firstKey];
      var flightFullData = FlightFullData.fromJson(firstFlightData);
      print(flightFullData.aircraft?.ff ?? "55");
      return flightFullData;
    } else {
      print("Error: ${response.statusCode}");
      return null;
    }
  }
}
