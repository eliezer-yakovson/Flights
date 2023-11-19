import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'FlightData.g.dart';

@JsonSerializable()
class FlightData {
  double latitude;
  double longitude;
  double radius_km;
  int total_flight;
  List<dynamic> flights;

  FlightData({
    required this.latitude,
    required this.longitude,
    required this.radius_km,
    required this.total_flight,
    required this.flights,
  });

  Map<String, dynamic> toJson() => _$FlightDataToJson(this);

  factory FlightData.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return _$FlightDataFromJson(json);
  }
}
