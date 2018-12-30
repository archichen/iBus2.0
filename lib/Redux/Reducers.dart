import 'package:ibus2/Entites/bus_info.dart';
import 'package:ibus2/Redux/Actions.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:redux/redux.dart';

IBusState appReducer(IBusState state, dynamic action) {
  state.stationName = stationNameReducer(state.stationName, action);
  state.busInfo = busInfoReducer(state.busInfo, action);
  state.locationState = locationReducer(state.locationState, action);
  return state;
}

final busInfoReducer = combineReducers<BusInfo> ([
  TypedReducer<BusInfo, UpdateBusInfoAction>(_busInfoReducer)
]);

BusInfo _busInfoReducer(BusInfo busInfo, UpdateBusInfoAction action) {

  return new BusInfo(action.busInfo.data);
}

final locationReducer = combineReducers<LocationState>([
  TypedReducer<LocationState, UpdateLocationAction>(_locationReducer)
]);

LocationState _locationReducer(LocationState locationState, UpdateLocationAction action) {
  return new LocationState(action.locationState.longitude, action.locationState.latitude);
}

final stationNameReducer = combineReducers<String>([
  TypedReducer<String, UpdateStationNameAction>(_stationNameReducer)
]);

String _stationNameReducer(String name, UpdateStationNameAction action) {
  return action.name;
}
