import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ibus2/Entites/baidu_map.dart';
import 'package:ibus2/Entites/bus_info.dart' as BI;
import 'package:ibus2/Entites/netease_musics.dart';
import 'package:ibus2/Entites/similar_stations.dart' as SS;
import 'package:ibus2/Redux/Actions.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:ibus2/StationLinePage/StationLinePage.dart';
import 'package:ibus2/configuration.dart';
import 'package:ibus2/mainPage/RecentBusList.dart';
import 'package:redux/redux.dart';
import 'package:location/location.dart' as Locate;
import 'package:video_player/video_player.dart';

class MainPage extends StatefulWidget {
  Store<IBusState> store;
  BaiduMap baiduMap;
  NeteaseMusics neteaseMusics;
  MainPage({this.baiduMap, this.neteaseMusics, this.store});
  MainPageState createState() => new MainPageState(
      baiduMap: baiduMap, neteaseMusics: neteaseMusics, store: store);
}

class MainPageState extends State {
  Store<IBusState> store;
  VideoPlayerController videoPlayerController;
  BaiduMap baiduMap;
  NeteaseMusics neteaseMusics;
  Locate.Location location;
  Dio dio;
  MainPageState({this.baiduMap, this.neteaseMusics, this.store});
  bool showMask = true;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        new VideoPlayerController.network(this.getNextVideo().url);
    videoPlayerController.initialize().then((_) {
      this.setState(() {});
      videoPlayerController.play();
    });
    videoPlayerController.addListener(() {
      if (!this.videoPlayerController.value.isPlaying &&
          this.videoPlayerController.value.position >=
              this.videoPlayerController.value.duration) {
        this.videoPlayerController =
            new VideoPlayerController.network(this.getNextVideo().url);
        this.videoPlayerController.play();
      }
    });

    getBusList();
    dio = new Dio();
    location = new Locate.Location();
    location.onLocationChanged().listen((Map<String, double> currentLocation) {
      getBusList(currentLocation: currentLocation);
    });
  }

  Future getBusList({Map<String, double> currentLocation}) async {
    String stationName;
    if (currentLocation != null) {
      Response response = await dio.get(Configuration.baiduMap(currentLocation),
          options: new Options(responseType: ResponseType.JSON));
      dynamic json = jsonDecode(response.data);
      baiduMap = BaiduMap.fromJson(json);
      stationName = baiduMap.results.first.name;
      store.dispatch(new UpdateStationNameAction(stationName));
    }
    stationName = store.state.stationName;
    SS.SimilarStations similarStations =
        await Configuration.get_similar_stations(stationName);
    SS.Data data = similarStations.data.first;
    BI.BusInfo busInfo =
        await Configuration.get_businfo(data.stationName, data.stationID);
    store.dispatch(new UpdateBusInfoAction(busInfo));
  }

  Data getNextVideo() {
    Data d = this.neteaseMusics.data.removeLast();
    this.neteaseMusics.data.insert(0, d);
    return d;
  }

  void videoTogglePlay() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
  }

  void navigatorToStationLinePage() {
    Navigator.push(this.context, new MaterialPageRoute(
        builder: (context) => new StationLinePage(store)
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreProvider<IBusState>(
      store: store,
      child: new Scaffold(
        body: new GestureDetector(
          onDoubleTap: videoTogglePlay,
          onTap: () => setState(() => this.showMask = !this.showMask),
          onHorizontalDragEnd: (d) {
            if (d.primaryVelocity < 0) {
              navigatorToStationLinePage();
            }
          },
          child: new Stack(
            children: <Widget>[
              new Container(
                  color: Colors.black,
                  child: new OverflowBox(
                    maxWidth: 1080,
                    child: new AspectRatio(
                      aspectRatio: 1.77,
                      child: new VideoPlayer(videoPlayerController),
                    ),
                  )),
              new Opacity(
                opacity: showMask ? 0.8: 0.0,
                child: new Container(
                    constraints: new BoxConstraints.expand(),
                    color: Colors.black,
                    child: new Stack(
                      children: <Widget>[
                        new Positioned(
                          left: 10,
                          top: 10,
                          child: new Container(
                              child: new StoreConnector<IBusState, String>(
                                  builder: (context, stationName) {
                                    return new Text(
                                      stationName,
                                      style: new TextStyle(
                                          fontSize: 48, color: Colors.white),
                                    );
                                  },
                                  converter: (store) =>
                                      store.state.stationName)),
                        ),
                        new Positioned(
                            bottom: 30,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                height: 300,
                                width: 410,
                                padding: new EdgeInsets.only(left: 50, right: 50),
                                child: new RecentBusList(store)),
                              ],
                            )
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
