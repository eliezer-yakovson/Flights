// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'FlightFullData.g.dart';

@JsonSerializable()
class FlightFullData {
  @JsonKey(name: "flight")
  final FlightInfo? flight;

  @JsonKey(name: "airline")
  final AirlineInfo? airline;

  @JsonKey(name: "aircraft")
  final AircraftInfo? aircraft;

  @JsonKey(name: "dep_airport")
  final AirportInfo? depAirport;

  @JsonKey(name: "arr_airport")
  final AirportInfo? arrAirport;

  final String? source;
  final String? station;

  FlightFullData({
    this.flight,
    this.airline,
    this.aircraft,
    this.depAirport,
    this.arrAirport,
    this.source,
    this.station,
  });
  
  Map<String, dynamic> toJson() => _$FlightFullDataToJson(this);

  factory FlightFullData.fromJson(Map<String, dynamic> json) =>
      _$FlightFullDataFromJson(json);

}

@JsonSerializable()
class FlightInfo {
  final double? latitude;
  final double? longitude;
  final String? callsign;
  final String? iata;
  final int? altitude;
  final int? squawk;
  final double? heading;
  final String? dep_scheduled;
  final String? arr_scheduled;
  final String? arr_estimated;
  final int? distance;
  final String? id;

  FlightInfo({
    this.latitude,
    this.longitude,
    this.callsign,
    this.iata,
    this.altitude,
    this.squawk,
    this.heading,
    this.dep_scheduled,
    this.arr_scheduled,
    this.arr_estimated,
    this.distance,
    this.id,
  });

  factory FlightInfo.fromJson(Map<String, dynamic> json) =>
      _$FlightInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FlightInfoToJson(this);
}

@JsonSerializable()
class AirlineInfo {
  final String? icao;
  final String? iata;
  final String? name;

  AirlineInfo({
    this.icao,
    this.iata,
    this.name,
  });

  factory AirlineInfo.fromJson(Map<String, dynamic> json) =>
      _$AirlineInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AirlineInfoToJson(this);
}

@JsonSerializable()
class AircraftInfo {
  final String? reg;
  final String? type;
  final String? desc;
   final String? photo1;
  final String? photo2;
  final String? number;
  final String? ff;
  final String? ff_date;

  AircraftInfo({
    this.reg,
    this.type,
    this.desc,
    this.number,
    this.ff,
    this.ff_date,
    this.photo1,
    this.photo2,
  });

  factory AircraftInfo.fromJson(Map<String, dynamic> json) =>
      _$AircraftInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AircraftInfoToJson(this);
}

@JsonSerializable()
class AirportInfo {
  final double? latitude;
  final double? longitude;
  final String? icao;
  final String? iata;
  final String? name;
  final String? city;
  final String? timezone_abbr;
  final String? timezone_name;
  final String? timezone;

  AirportInfo({
    this.latitude,
    this.longitude,
    this.icao,
    this.iata,
    this.name,
    this.city,
    this.timezone_abbr,
    this.timezone_name,
    this.timezone,
  });

  factory AirportInfo.fromJson(Map<String, dynamic> json) =>
      _$AirportInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AirportInfoToJson(this);
}
