// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'netease_musics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeteaseMusics _$NeteaseMusicsFromJson(Map<String, dynamic> json) {
  return NeteaseMusics(
      json['result'] as String,
      json['code'] as int,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NeteaseMusicsToJson(NeteaseMusics instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['id'] as String,
      json['name'] as String,
      json['singer'] as String,
      json['playCount'] as int,
      json['pic'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'singer': instance.singer,
      'playCount': instance.playCount,
      'pic': instance.pic,
      'url': instance.url
    };
