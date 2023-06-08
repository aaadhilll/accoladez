part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class WeatherDetialsEvent extends WeatherEvent {
  final String cityName;
  WeatherDetialsEvent({required this.cityName});
}
