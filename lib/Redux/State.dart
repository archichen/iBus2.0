class IBusState {
  // 当前定位
  LocationState locationState;
  // 当前站点公交列表
  BusList busList;

  IBusState({BusList busList, LocationState locationState})
      :locationState = locationState,
        busList = busList;
}

class LocationState {
  double longitude;
  double latitude;

  LocationState(this.longitude, this.latitude);
}

class BusList {
  List<BusEntry> busList;

  BusList(this.busList);
}

class BusEntry {
  String busName;
  String status;
  String terminal;

  BusEntry(this.busName, this.status, this.terminal);
}