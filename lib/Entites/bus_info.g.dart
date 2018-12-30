// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusInfo _$BusInfoFromJson(Map<String, dynamic> json) {
  return BusInfo((json['data'] as List)
      ?.map((e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$BusInfoToJson(BusInfo instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['busName'] as String, json['status'] as String,
      json['terminal'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'busName': instance.busName,
      'status': instance.status,
      'terminal': instance.terminal
    };
