import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VehcileEvent extends Equatable {
  VehcileEvent([List props = const <dynamic>[]]);
}

// The only event in this app is for getting the weather
class GetVehicle extends VehcileEvent {
  final String vehicleName;
  final String vehicleType;

  // Equatable allows for a simple value equality in Dart.
  // All you need to do is to pass the class fields to the super constructor.
  GetVehicle(this.vehicleName,this.vehicleType) : super([vehicleName,vehicleType]);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}