// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return Vehicle(
    vehicleName: json['vehicleName'] as String,
   vehicleType: json['vehicleType'] as String,
  );
}

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'vehicleName': instance.vehicleName,
      'vehicleType': instance.vehicleType,
    };
