import 'package:json_annotation/json_annotation.dart'; 
  
part 'similar_stations.g.dart';


@JsonSerializable()
  class SimilarStations extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  SimilarStations(this.data,);

  factory SimilarStations.fromJson(Map<String, dynamic> srcJson) => _$SimilarStationsFromJson(srcJson);

}

  
@JsonSerializable()
  class Data extends Object  {

  @JsonKey(name: 'stationName')
  String stationName;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'stationID')
  String stationID;

  Data(this.stationName,this.location,this.stationID,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}

  
