import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

// Define WeatherBlocState as a base class for state extension.
abstract class WeatherBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherBlocInitial extends WeatherBlocState {}

class WeatherBlocLoading extends WeatherBlocState {}

class WeatherBlocFailure extends WeatherBlocState {}

class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  WeatherBlocSuccess({required this.weather});

  @override
  List<Object?> get props => [weather];
}
