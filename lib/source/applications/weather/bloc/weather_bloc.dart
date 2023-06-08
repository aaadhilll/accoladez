import 'package:accolades/source/ifrastructure/weather_check.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<WeatherDetialsEvent>((event, emit) async {
      emit(Initial());
      var res = await ApiWeatherCheck().getWeatherData(city: event.cityName);
      print('888888888888888888');
      print(res);

      res.fold((left) => emit(WeateherDataState(model: left)),
          (right) => emit(ErrorDataState(models: right)));
    });
  }
}
