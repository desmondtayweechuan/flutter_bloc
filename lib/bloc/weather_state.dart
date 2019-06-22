import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../model/weather.dart';

//What will the Bloc output in reaction to the incoming events,
//so that the UI can react to the output

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

// InitialWeatherState
class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

// Only the WeatherLoaded event needs to contain data
class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather) : super([weather]);
}
