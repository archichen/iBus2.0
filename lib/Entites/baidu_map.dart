import 'package:json_annotation/json_annotation.dart';

part 'baidu_map.g.dart';


@JsonSerializable()
class BaiduMap extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'results')
  List<Results> results;

  BaiduMap(this.status,this.message,this.results,);

  factory BaiduMap.fromJson(Map<String, dynamic> srcJson) => _$BaiduMapFromJson(srcJson);

}


@JsonSerializable()
class Results extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'location')
  Location location;

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'area')
  String area;

  @JsonKey(name: 'detail')
  int detail;

  @JsonKey(name: 'uid')
  String uid;

  Results(this.name,this.location,this.address,this.province,this.city,this.area,this.detail,this.uid,);

  factory Results.fromJson(Map<String, dynamic> srcJson) => _$ResultsFromJson(srcJson);

}


@JsonSerializable()
class Location extends Object{

  @JsonKey(name: 'lat')
  double lat;

  @JsonKey(name: 'lng')
  double lng;

  Location(this.lat,this.lng,);

  factory Location.fromJson(Map<String, dynamic> srcJson) => _$LocationFromJson(srcJson);

}

  
