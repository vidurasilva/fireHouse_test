import 'package:flutter/material.dart';
import 'package:test_fire_h/models/cities_model.dart';
import 'package:test_fire_h/models/weather_model.dart';
import 'package:test_fire_h/ui/wether_detail_page.dart';
import 'package:test_fire_h/ui/widget/city_card.dart';
import 'package:test_fire_h/utility/loader.dart';
import 'package:test_fire_h/utility/read_json.dart';
import 'package:test_fire_h/services/featch_data.dart';

class CityGrid extends StatefulWidget {
  const CityGrid({super.key});

  @override
  State<CityGrid> createState() => _CityGridState();
}

class _CityGridState extends State<CityGrid> {
  List<CityElement> listOfCity = [];
  @override
  void initState() {
    readCityJson().then((value) {
      setState(() {
        listOfCity = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: listOfCity.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: MyCard(
                    cityElement: listOfCity[index],
                    icon: Icons.location_city_sharp),
                onTap: () async {
                  loader(context);
                  await featchOpenWeather(cityCode: listOfCity[index].cityCode!)
                      .then((value) {
                    List<ListElement>? weatherList = value.list;
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherDetailsPage(
                              city: listOfCity[index],
                              weatherList: weatherList!)),
                    );
                  });
                },
              );
            }),
      ),
    );
  }
}
