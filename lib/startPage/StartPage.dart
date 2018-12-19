import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'package:ibus2/Entites/kaiyan_videos.dart';
import 'package:ibus2/configuration.dart';
import 'package:location/location.dart';

class StartPage extends StatefulWidget {
  @override
  StartPageState createState() => new StartPageState();
}

class StartPageState extends State<StartPage> {
  Dio dio = new Dio();
  bool getKaiyanVideoSwitch = false;
  bool getLocationSwitch = false;
  Location location = new Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationMap();
    getKaiyanVideos();
  }

  Future getLocationMap() async {
   Map<String, double> locateMap = await location.getLocation();
   // TODO: continue
  }

  Future getKaiyanVideos() async {
      Response response = await dio.get(Configuration.kaiyanApiURL, options: new Options(headers: {
        "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Mobile Safari/537.36"
      }));

      KaiyanVideos kaiyanVideos = KaiyanVideos.fromJson(response.data);

      getKaiyanVideoSwitch = true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
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
    );
  }
}