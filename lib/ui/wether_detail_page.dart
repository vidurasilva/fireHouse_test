import 'package:flutter/material.dart';
import 'package:test_fire_h/models/cities_model.dart';
import 'package:test_fire_h/models/weather_model.dart';
import 'dart:async';
import 'package:test_fire_h/services/featch_data.dart';
import 'package:test_fire_h/ui/widget/weather_card.dart';

class WeatherDetailsPage extends StatefulWidget {
  final CityElement city;
  final List<ListElement> weatherList;
  const WeatherDetailsPage(
      {super.key, required this.city, required this.weatherList});

  @override
  State<WeatherDetailsPage> createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  Timer? _timer;
  List<ListElement> weatherList = [];

  @override
  void initState() {
    weatherList = widget.weatherList;
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneMin = const Duration(seconds: 60);
    // ignore: unnecessary_new
    _timer = new Timer.periodic(
      oneMin,
      (Timer timer) async {
        await featchOpenWeather(cityCode: widget.city.cityCode!).then((value) {
          setState(() {
            weatherList = value.list!;
          });
        });
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.city.cityName}")),
      body: ListView.builder(
          itemCount: weatherList[0].weather?.length,
          itemBuilder: (BuildContext context, int index) {
            return WeatherCard(
                weatherElement: weatherList[0].weather?[index],
                icon: Icons.cloud);
          }),
    );
  }
}
