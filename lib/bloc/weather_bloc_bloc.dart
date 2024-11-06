import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart'; // Make sure this import aligns with your package
import 'package:weather_app/data/data.dart';
import 'weather_bloc_event.dart';
import 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading()); // Emit the loading state
      
      try {
        // Initialize the WeatherFactory with the correct API key
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        
        // Fetch the current weather using latitude and longitude
        print("Fetching weather for location: (${event.position.latitude}, ${event.position.longitude})");
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        
        // Print weather data for debugging
        print("Weather data fetched: $weather");
        
        // Emit the success state with weather data
        emit(WeatherBlocSuccess(weather: weather));
      } catch (e) {
        // Print the error for debugging purposes
        print("Failed to fetch weather: $e");
        
        // Emit the failure state
        emit(WeatherBlocFailure());
      }
    });
  }
}
