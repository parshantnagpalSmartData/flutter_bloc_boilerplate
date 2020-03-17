import 'dart:async';
import 'dart:math';

import 'package:fleet_management/container/dashboard/vehicles.dart';

import './vehicleEvent.dart';
import './vehicleState.dart';
import '../../modal/vehicle.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


class VehicleBloc extends HydratedBloc<VehcileEvent, VehicleState> {
  @override
  VehicleState get initialState {
    return super.initialState ?? VehicleInitial();
  }

  @override
  VehicleState fromJson(Map<String, dynamic> json) {
    try {
      final vehicle = Vehicle.fromJson(json);
      return VehicleLoaded(vehicle);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(VehicleState state) {
    if (state is VehicleLoaded) {
      return state.vehicle.toJson();
    } else {
      return null;
    }
  }

  @override
  Stream<VehicleState> mapEventToState(
    VehcileEvent event,
  ) async* {
    if (event is GetVehicle) {
      // Outputting a state from the asynchronous generator
      yield VehicleLoading();
      final weather = await _fetchWeatherFromFakeApi(event.vehicleName,event.vehicleType);
      yield VehicleLoaded(weather);
    }
  }

  Future<Vehicle> _fetchWeatherFromFakeApi(String vehicleName,String vehicleType) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return Vehicle(
          vehicleName: vehicleName,
          // Temperature between 20 and 35.99
          vehicleType: vehicleType,
        );
      },
    );
  }
}