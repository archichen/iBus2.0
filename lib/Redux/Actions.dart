import 'package:ibus2/Redux/State.dart';

class UpdateBusListAction {
  BusList busList;

  UpdateBusListAction(this.busList);
}

class UpdateLocationAction {
  LocationState locationState;

  UpdateLocationAction(this.locationState);
}