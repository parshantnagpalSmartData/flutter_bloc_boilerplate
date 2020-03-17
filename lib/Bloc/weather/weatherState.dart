import '../../modal/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]);
}

class WeatherInitial extends WeatherState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// Only the WeatherLoaded event needs to contain data
class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather) : super([weather]);

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}