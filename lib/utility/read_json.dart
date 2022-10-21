import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:test_fire_h/models/cities_model.dart';

Future<List<CityElement>> readCityJson() async {
  if (kDebugMode) {
    print('Read City Json File:');
  }
  final String response = await rootBundle.loadString('assets/Step1.json');
  CityList data = cityListFromJson(response);
  List<CityElement> listOfCity = [];
  listOfCity = data.list!;
  return listOfCity;
}
