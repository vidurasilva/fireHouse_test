import 'package:flutter/material.dart';
import 'package:test_fire_h/models/cities_model.dart';

class MyCard extends StatelessWidget {
  final CityElement? cityElement;
  final IconData? icon;
  MyCard({super.key, this.cityElement, this.icon});

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
          title: Text(cityElement!.cityName!,
              style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Text(cityElement!.cityCode!,
                style: TextStyle(color: Colors.white))),
      ]),
    );
  }
}
