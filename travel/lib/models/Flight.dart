// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'Flight.g.dart';

@JsonSerializable()
class Flight {
  String? airline;
  int? altitude;
  String? arrival;
  List<double>? arrival_position;
  String? departure;
  List<double>? departure_position;
  String flight;
  dynamic groundspeed;
  dynamic heading;
  double? latitude;
  double? longitude;
  String? registration;
  String? source;
  String? station;
  int? timestamp;
  String? type;
  dynamic verticalspeed;

  Flight({
    this.airline,
    this.altitude,
    this.arrival,
    this.arrival_position,
    this.departure,
    this.departure_position,
    required this.flight,
    this.groundspeed,
    this.heading,
    this.latitude,
    this.longitude,
    this.registration,
    this.source,
    this.station,
    this.timestamp,
    this.type,
    this.verticalspeed,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);
  Map<String, dynamic> toJson() => _$FlightToJson(this);
}
