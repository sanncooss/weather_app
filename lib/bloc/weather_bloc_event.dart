import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();
}

class FetchWeather extends WeatherBlocEvent {
  final Position position;

  const FetchWeather({required this.position});
  
  @override
  List<Object?> get props => [position];
}
