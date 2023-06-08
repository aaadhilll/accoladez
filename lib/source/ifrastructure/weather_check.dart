import 'package:either_dart/either.dart';
import 'package:http/http.dart';

import '../model/weather_model.dart';

class ApiWeatherCheck {
  Future<Either<WheatherModel, String>> getWeatherData({required city}) async {
    String _url =
        "https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=e426f526f5ea2a486e3e7b6b1a169f37";

    Response _res = await get(Uri.parse(_url));
    print(_res.body);

    return _res.statusCode == 200
        ? Left(wheatherModelFromJson(_res.body))
        : const Right('Please enter valid city name');
  }
}
