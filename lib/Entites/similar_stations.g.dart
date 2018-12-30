// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_stations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarStations _$SimilarStationsFromJson(Map<String, dynamic> json) {
  return SimilarStations((json['data'] as List)
      ?.map((e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$SimilarStationsToJson(SimilarStations instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['stationName'] as String, json['location'] as String,
      json['stationID'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'stationName': instance.stationName,
      'location': instance.location,
      'stationID': instance.stationID
    };
