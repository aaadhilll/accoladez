part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

//
class Initial extends WeatherState {}

class WeateherDataState extends WeatherState {
  final WheatherModel model;
  WeateherDataState({required this.model});
}

class ErrorDataState extends WeatherState {
  final String models;
  ErrorDataState({required this.models});
}
