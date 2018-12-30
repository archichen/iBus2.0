import 'package:ibus2/Entites/bus_info.dart';
import 'package:ibus2/Redux/State.dart';

class UpdateBusInfoAction {
  BusInfo busInfo;

  UpdateBusInfoAction(this.busInfo);
}

class UpdateLocationAction {
  LocationState locationState;

  UpdateLocationAction(this.locationState);
}

class UpdateStationNameAction {
  String name;

  UpdateStationNameAction(this.name);
}