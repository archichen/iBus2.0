import 'package:ibus2/Redux/Actions.dart';
import 'package:ibus2/Redux/State.dart';
import 'package:redux/redux.dart';

IBusState appReducer(IBusState state, dynamic action) {
  return new IBusState(
    busList: busListReducer(state.busList, action),
    locationState: locationReducer(state.locationState, action)
  );
}

final busListReducer = combineReducers<BusList> ([
  TypedReducer<BusList, UpdateBusListAction>(_busListReducer)
]);

BusList _busListReducer(BusList busList, UpdateBusListAction action) {

  return BusList(action.busList.busList);
}

final locationReducer = combineReducers<LocationState>([
  TypedReducer<LocationState, UpdateLocationAction>(_locationReducer)
]);

LocationState _locationReducer(LocationState locationState, UpdateLocationAction action) {
  return new LocationState(action.locationState.longitude, action.locationState.latitude);
}
