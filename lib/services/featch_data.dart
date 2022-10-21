import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:test_fire_h/models/weather_model.dart';

Future<OpenWeatherMapModel> featchOpenWeather(
    {required String cityCode}) async {
  // Call http://api.openweathermap.org/data/2.5/group
  Map<String, String> map = {};
  if (kDebugMode) {
    debugPrint('inside File:');
  }
  OpenWeatherMapModel responceOfWeather = OpenWeatherMapModel();
  map['id'] = cityCode;
  map["units"] = "metric";
  map["appid"] = "1c7f727a8843e69111bd5895195e82db";

  var url = Uri.https('api.openweathermap.org', '/data/2.5/group', map);

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (kDebugMode) {
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
  }
  if (response.statusCode == 200) {
    responceOfWeather = openWeatherMapModelFromJson(response.body);
    print('Done ${response.body}');
    if (kDebugMode) {
      debugPrint('Done File:');
    }
    return responceOfWeather;
  } else {
    if (kDebugMode) {
      debugPrint('Fail File:');
    }
    print('Request failed with status: ${response.statusCode}.');
    return responceOfWeather;
  }
}
