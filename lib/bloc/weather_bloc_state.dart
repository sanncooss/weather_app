import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

// Mark WeatherBlocState as a base class to allow extension by other classes.
base class WeatherBlocState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {
  @override
  List<Object?> get props => [];
}

final class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  WeatherBlocSuccess({required this.weather});

  @override
  List<Object?> get props => [weather];
}
