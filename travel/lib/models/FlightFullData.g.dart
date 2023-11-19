// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlightFullData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightFullData _$FlightFullDataFromJson(Map<String, dynamic> json) =>
    FlightFullData(
      flight: json['flight'] == null
          ? null
          : FlightInfo.fromJson(json['flight'] as Map<String, dynamic>),
      airline: json['airline'] == null
          ? null
          : AirlineInfo.fromJson(json['airline'] as Map<String, dynamic>),
      aircraft: json['aircraft'] == null
          ? null
          : AircraftInfo.fromJson(json['aircraft'] as Map<String, dynamic>),
      depAirport: json['dep_airport'] == null
          ? null
          : AirportInfo.fromJson(json['dep_airport'] as Map<String, dynamic>),
      arrAirport: json['arr_airport'] == null
          ? null
          : AirportInfo.fromJson(json['arr_airport'] as Map<String, dynamic>),
      source: json['source'] as String?,
      station: json['station'] as String?,
    );

Map<String, dynamic> _$FlightFullDataToJson(FlightFullData instance) =>
    <String, dynamic>{
      'flight': instance.flight,
      'airline': instance.airline,
      'aircraft': instance.aircraft,
      'dep_airport': instance.depAirport,
      'arr_airport': instance.arrAirport,
      'source': instance.source,
      'station': instance.station,
    };

FlightInfo _$FlightInfoFromJson(Map<String, dynamic> json) => FlightInfo(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      callsign: json['callsign'] as String?,
      iata: json['iata'] as String?,
      altitude: json['altitude'] as int?,
      squawk: json['squawk'] as int?,
      heading: (json['heading'] as num?)?.toDouble(),
      dep_scheduled: json['dep_scheduled'] as String?,
      arr_scheduled: json['arr_scheduled'] as String?,
      arr_estimated: json['arr_estimated'] as String?,
      distance: json['distance'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$FlightInfoToJson(FlightInfo instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'callsign': instance.callsign,
      'iata': instance.iata,
      'altitude': instance.altitude,
      'squawk': instance.squawk,
      'heading': instance.heading,
      'dep_scheduled': instance.dep_scheduled,
      'arr_scheduled': instance.arr_scheduled,
      'arr_estimated': instance.arr_estimated,
      'distance': instance.distance,
      'id': instance.id,
    };

AirlineInfo _$AirlineInfoFromJson(Map<String, dynamic> json) => AirlineInfo(
      icao: json['icao'] as String?,
      iata: json['iata'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AirlineInfoToJson(AirlineInfo instance) =>
    <String, dynamic>{
      'icao': instance.icao,
      'iata': instance.iata,
      'name': instance.name,
    };

AircraftInfo _$AircraftInfoFromJson(Map<String, dynamic> json) => AircraftInfo(
      reg: json['reg'] as String?,
      type: json['type'] as String?,
      desc: json['desc'] as String?,
      number: json['number'] as String?,
      ff: json['ff'] as String?,
      ff_date: json['ff_date'] as String?,
      photo1: json['photo1'] as String?,
      photo2: json['photo2'] as String?,
    );

Map<String, dynamic> _$AircraftInfoToJson(AircraftInfo instance) =>
    <String, dynamic>{
      'reg': instance.reg,
      'type': instance.type,
      'desc': instance.desc,
      'photo1': instance.photo1,
      'photo2': instance.photo2,
      'number': instance.number,
      'ff': instance.ff,
      'ff_date': instance.ff_date,
    };

AirportInfo _$AirportInfoFromJson(Map<String, dynamic> json) => AirportInfo(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      icao: json['icao'] as String?,
      iata: json['iata'] as String?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      timezone_abbr: json['timezone_abbr'] as String?,
      timezone_name: json['timezone_name'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$AirportInfoToJson(AirportInfo instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'icao': instance.icao,
      'iata': instance.iata,
      'name': instance.name,
      'city': instance.city,
      'timezone_abbr': instance.timezone_abbr,
      'timezone_name': instance.timezone_name,
      'timezone': instance.timezone,
    };
