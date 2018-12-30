import 'package:json_annotation/json_annotation.dart';

part 'line_list.g.dart';


@JsonSerializable()
class LineList extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  LineList(this.data,);

  factory LineList.fromJson(Map<String, dynamic> srcJson) => _$LineListFromJson(srcJson);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'lineID')
  String lineID;

  @JsonKey(name: 'lineName')
  String lineName;

  @JsonKey(name: 'lineDire')
  String lineDire;

  Data(this.lineID,this.lineName,this.lineDire,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
