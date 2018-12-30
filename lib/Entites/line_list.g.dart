// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineList _$LineListFromJson(Map<String, dynamic> json) {
  return LineList((json['data'] as List)
      ?.map((e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$LineListToJson(LineList instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['lineID'] as String, json['lineName'] as String,
      json['lineDire'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'lineID': instance.lineID,
      'lineName': instance.lineName,
      'lineDire': instance.lineDire
    };
