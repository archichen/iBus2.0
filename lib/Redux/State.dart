import 'package:ibus2/Entites/bus_info.dart';

class IBusState {
  // 当前定位
  LocationState locationState;
  // 当前站点公交列表
  BusInfo busInfo;

  String stationName;

  IBusState({BusInfo busInfo, LocationState locationState, String stationName})
      :locationState = locationState,
        busInfo = busInfo,
        stationName = stationName;
}

class LocationState {
  double longitude;
  double latitude;

  LocationState(this.longitude, this.latitude);
}