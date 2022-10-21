import 'package:flutter/material.dart';
import 'package:test_fire_h/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather? weatherElement;
  final IconData? icon;
  WeatherCard({super.key, this.weatherElement, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      color: Colors.amber,
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: Icon(icon, size: 70),
          title: Text(weatherElement!.description!,
              style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Text(weatherElement!.main!,
                style: TextStyle(color: Colors.white))),
      ]),
    );
  }
}
