import 'package:equatable/equatable.dart';

// @sealed
abstract class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();
}

// Define FetchWeather as a subclass of WeatherBlocEvent
class FetchWeather extends WeatherBlocEvent {
  final String cityName;

  FetchWeather({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}
