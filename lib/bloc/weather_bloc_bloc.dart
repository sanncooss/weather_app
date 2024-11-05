import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weather_bloc_event.dart';
import 'package:weather_app/bloc/weather_bloc_state.dart';
import 'package:weather_app/data/data.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      WeatherBlocLoading();
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Position position = await Geolocator.getCurrentPosition();
        Weather weather = await wf.currentWeatherByLocation(
            position.latitude, position.longitude);
        emit(
          WeatherBlocSuccess(weather: weather),
        );
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
