import 'package:json_annotation/json_annotation.dart';

part 'bus_status.g.dart';


@JsonSerializable()
class BusStatus extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'data')
  List<Data> data;

  BusStatus(this.status,this.data,);

  factory BusStatus.fromJson(Map<String, dynamic> srcJson) => _$BusStatusFromJson(srcJson);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'BusInfo')
  String busInfo;

  @JsonKey(name: 'Code')
  String code;

  @JsonKey(name: 'ID')
  int iD;

  @JsonKey(name: 'InTime')
  String inTime;

  @JsonKey(name: 'OutTime')
  String outTime;

  @JsonKey(name: 'StationCName')
  String stationCName;

  Data(this.busInfo,this.code,this.iD,this.inTime,this.outTime,this.stationCName,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
