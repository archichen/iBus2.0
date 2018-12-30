import 'package:json_annotation/json_annotation.dart';

part 'bus_info.g.dart';


@JsonSerializable()
class BusInfo extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  BusInfo(this.data,);

  factory BusInfo.fromJson(Map<String, dynamic> srcJson) => _$BusInfoFromJson(srcJson);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'busName')
  String busName;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'terminal')
  String terminal;

  Data(this.busName,this.status,this.terminal,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
