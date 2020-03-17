import '../../modal/vehicle.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VehicleState extends Equatable {
  VehicleState([List props = const []]);
}

class VehicleInitial extends VehicleState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class VehicleLoading extends VehicleState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// Only the WeatherLoaded event needs to contain data
class VehicleLoaded extends VehicleState {
  final Vehicle vehicle;

  VehicleLoaded(this.vehicle) : super([vehicle]);

  @override
  // TODO: implement props
  List<Object> get props => [vehicle];
}