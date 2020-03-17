import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle extends Equatable {
  final String vehicleName;
  final String vehicleType;

  Vehicle({
    @required this.vehicleName,
    @required this.vehicleType,
  }) ;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}