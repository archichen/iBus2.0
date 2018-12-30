import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ibus2/Entites/bus_info.dart';
import 'package:ibus2/Entites/bus_status.dart';
import 'package:ibus2/Entites/line_list.dart';
import 'package:ibus2/Entites/similar_stations.dart';

class Configuration {
  static String kaiyanApiURL = "http://baobab.kaiyanapp.com/api/v4/tabs/selected";
  static String neteaseMusicURL = "https://api.bzqll.com/music/netease/topMvList?key=579621905&limit=10&offset=0";
  static String baiduMap(Map<String, double> location) {
    return "http://api.map.baidu.com/place/v2/search?query=%E5%85%AC%E4%BA%A4%E8%BD%A6%E7%AB%99&location=${location["latitude"]}, ${location["longitude"]}&radius=2000&output=json&ak=fWia9laRosoqefLNHnIUt6aqOpTaWEkM&filter=sort_name:distance|sort_rule:1";
  }
  static String host = "http://127.0.0.1";

  static Future<SimilarStations> get_similar_stations(String stationName) async {
    stationName = stationName.replaceAll("(", "（").replaceAll(")", "）");
    String url = "${host}/get_similar_stations/${stationName}";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    dynamic json = jsonDecode(response.data);
    SimilarStations similarStations = SimilarStations.fromJson(json);
    return similarStations;
  }
  static Future<BusInfo> get_businfo(String stationName, String stationID) async {
    stationName = stationName.replaceAll("(", "（").replaceAll(")", "）");
    String url = "${host}/get_businfo/${stationName}/${stationID}";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    dynamic json = jsonDecode(response.data);
    BusInfo busInfo = BusInfo.fromJson(json);
    return busInfo;
  }
  static Future<LineList> get_linelist(String lineName) async {
    String url = "${host}/get_linelist/${lineName}";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    dynamic json = jsonDecode(response.data);
    LineList lineList = LineList.fromJson(json);
    return lineList;
  }
  static Future<BusStatus> get_bustatus(String lineID) async {
    String url = "${host}/get_bustatus/${lineID}";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    dynamic json = jsonDecode(response.data);
    BusStatus busStatus = BusStatus.fromJson(json);
    return busStatus;
  }

  static void dp(String str) {
    debugPrint("=== Debug print Start ===");
    debugPrint(str);
    debugPrint("=== Debug print End ===");
  }
}