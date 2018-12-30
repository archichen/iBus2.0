import 'package:json_annotation/json_annotation.dart'; 
  
part 'netease_musics.g.dart';


@JsonSerializable()
  class NeteaseMusics extends Object {

  @JsonKey(name: 'result')
  String result;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  List<Data> data;

  NeteaseMusics(this.result,this.code,this.data,);

  factory NeteaseMusics.fromJson(Map<String, dynamic> srcJson) => _$NeteaseMusicsFromJson(srcJson);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'singer')
  String singer;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'url')
  String url;

  Data(this.id,this.name,this.singer,this.playCount,this.pic,this.url,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
