// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baidu_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaiduMap _$BaiduMapFromJson(Map<String, dynamic> json) {
  return BaiduMap(
      json['status'] as int,
      json['message'] as String,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Results.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$BaiduMapToJson(BaiduMap instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
      json['name'] as String,
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['address'] as String,
      json['province'] as String,
      json['city'] as String,
      json['area'] as String,
      json['detail'] as int,
      json['uid'] as String);
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'address': instance.address,
      'province': instance.province,
      'city': instance.city,
      'area': instance.area,
      'detail': instance.detail,
      'uid': instance.uid
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      (json['lat'] as num)?.toDouble(), (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$LocationToJson(Location instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
