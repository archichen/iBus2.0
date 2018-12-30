// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusStatus _$BusStatusFromJson(Map<String, dynamic> json) {
  return BusStatus(
      json['status'] as int,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BusStatusToJson(BusStatus instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['BusInfo'] as String,
      json['Code'] as String,
      json['ID'] as int,
      json['InTime'] as String,
      json['OutTime'] as String,
      json['StationCName'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'BusInfo': instance.busInfo,
      'Code': instance.code,
      'ID': instance.iD,
      'InTime': instance.inTime,
      'OutTime': instance.outTime,
      'StationCName': instance.stationCName
    };
