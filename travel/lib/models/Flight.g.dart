// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flight _$FlightFromJson(Map<String, dynamic> json) => Flight(
      airline: json['airline'] as String?,
      altitude: json['altitude'] as int?,
      arrival: json['arrival'] as String?,
      arrival_position: (json['arrival_position'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      departure: json['departure'] as String?,
      departure_position: (json['departure_position'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      flight: json['flight'] as String,
      groundspeed: json['groundspeed'],
      heading: json['heading'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      registration: json['registration'] as String?,
      source: json['source'] as String?,
      station: json['station'] as String?,
      timestamp: json['timestamp'] as int?,
      type: json['type'] as String?,
      verticalspeed: json['verticalspeed'],
    );

Map<String, dynamic> _$FlightToJson(Flight instance) => <String, dynamic>{
      'airline': instance.airline,
      'altitude': instance.altitude,
      'arrival': instance.arrival,
      'arrival_position': instance.arrival_position,
      'departure': instance.departure,
      'departure_position': instance.departure_position,
      'flight': instance.flight,
      'groundspeed': instance.groundspeed,
      'heading': instance.heading,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'registration': instance.registration,
      'source': instance.source,
      'station': instance.station,
      'timestamp': instance.timestamp,
      'type': instance.type,
      'verticalspeed': instance.verticalspeed,
    };
