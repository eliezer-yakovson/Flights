// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlightData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightData _$FlightDataFromJson(Map<String, dynamic> json) => FlightData(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radius_km: (json['radius_km'] as num).toDouble(),
      total_flight: json['total_flight'] as int,
      flights: json['flights'] as List<dynamic>,
    );

Map<String, dynamic> _$FlightDataToJson(FlightData instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius_km': instance.radius_km,
      'total_flight': instance.total_flight,
      'flights': instance.flights,
    };
