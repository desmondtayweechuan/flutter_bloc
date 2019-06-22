import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutterbloc/model/weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // async generator that output a stream (a sequence of multiple object)
    // TODO: Add Logic
    if (event is GetWeather) {
      //output event to a stream
      yield WeatherLoading();
      final weather = await _fetchWeatherFromFakeApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    //Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return Weather(
            cityName: cityName,
            //Temp between 20 and 35.99
            temperature: 20 + Random().nextInt(15) + Random().nextDouble());
      },
    );
  }
}
