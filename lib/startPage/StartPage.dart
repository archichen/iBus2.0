import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'package:ibus2/Entites/baidu_map.dart';
import 'package:ibus2/Entites/kaiyan_videos.dart';
import 'package:ibus2/Entites/netease_musics.dart';
import 'package:ibus2/Redux/Actions.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:ibus2/configuration.dart';
import 'package:ibus2/mainPage/MainPage.dart';
import 'package:location/location.dart' as Locate;
import 'package:redux/redux.dart';
import 'dart:convert';

class StartPage extends StatefulWidget {
  Store<IBusState> store;
  StartPage({this.store});
  @override
  StartPageState createState() => new StartPageState(store: store);
}

class StartPageState extends State<StartPage> {
  Dio dio = new Dio();
  bool getNeteaseMusicsSwitch = false;
  bool getLocationSwitch = false;
  bool getBaiduMapSwitch = false;
  BaiduMap baiduMap;
  Locate.Location location = new Locate.Location();
  NeteaseMusics neteaseMusics;
  Map<String, double> locateMap = {"longitude":120.576596, "latitude": 31.256406};
  Store<IBusState> store;

  StartPageState({this.store});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future getLocationMap() async {
//     locateMap = location.getLocation() as Map<String, double>;
     print("getLocationMap Done");
     this.setState(() => this.getLocationSwitch = true);
  }

  Future getRecentStation() async {
    Response response = await dio.get(Configuration.baiduMap(this.locateMap), options: new Options(responseType: ResponseType.JSON));
    dynamic json = jsonDecode(response.data);
    baiduMap = BaiduMap.fromJson(json);
    String stationName = baiduMap.results.first.name;
    store.dispatch(new UpdateStationNameAction(stationName));
    print("getRecentStation Done");
    this.setState(()=> this.getBaiduMapSwitch = true);
  }

  Future getNeteaseMusics() async {
    Response response = await dio.get(Configuration.neteaseMusicURL, options: new Options(headers: {
      "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Mobile Safari/537.36"
    }));
    neteaseMusics = NeteaseMusics.fromJson(response.data);
    print("getNeteaseMusics Done");
    this.setState(() => this.getNeteaseMusicsSwitch = true);
  }

  init() async {
    // TODO: 暂未找到合适的Flutter生命周期函数去执行此init方法。预期在build结束之后的回调中使用init方法，异步初始化数据。但是Flutter中暂未找到合适的回调方法
    await getLocationMap();
    await getNeteaseMusics();
    await getRecentStation();
//    new Future.delayed(new Duration(seconds: 3));
    if (this.getLocationSwitch && this.getNeteaseMusicsSwitch && this.getBaiduMapSwitch) {
      Navigator.push(this.context, new MaterialPageRoute(builder: (context) => new MainPage(
        baiduMap: baiduMap,
        neteaseMusics: neteaseMusics,
        store: store,
      )));
//      Navigator.pushNamed(this.context, "/mainPage");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreProvider<IBusState>(
        store: store,
        child: new Scaffold(
          body: new Container(
              color: new Color(0xFF5D9DFF),
              width: double.infinity,
              height: double.infinity,
              child: new Column(
                children: <Widget>[
                  new Container(
                    padding: new EdgeInsets.only(top: 400.0),
                  ),
                  new Container(
                    child: new Text(
                        "IBus",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 50.0
                        )
                    ),
                  ),
                  new Container(
                    child: new Text(
                        "爱巴士，一路有我相伴",
                        style: new TextStyle(
                          color: Colors.white,
                        )
                    ),
                  ),
                  new Container(
                    margin: new EdgeInsets.only(top: 50.0),
                    child: SpinKitCircle(color: Colors.white,),
                  )
                ],
              )),
        )
    );
  }
}