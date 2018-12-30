import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ibus2/Entites/bus_status.dart';
import 'package:ibus2/configuration.dart';

class LineInfoPage extends StatefulWidget {
  String lineID;
  LineInfoPage(this.lineID);
  LineInfoPageState createState() => new LineInfoPageState(this.lineID);
}

class LineInfoPageState extends State {
  String lineID;
  LineInfoPageState(this.lineID);
  BusStatus busStatus = new BusStatus(0, []);
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    init(lineID);
  }
  
  void init(String lineid) async {
    BusStatus bs = await Configuration.get_bustatus(lineid);
    this.setState(() {
      busStatus = bs;
    });
  }

  Widget BusStatusList() {
    if(this.busStatus.status != 1) {
      return new SpinKitFadingCube(color: Colors.white,);
    } else {
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: new Color(0xFF111111),
      body: new Container(
        child: BusStatusList(),
      ),
    );
  }
}