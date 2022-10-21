import 'dart:convert';

OpenWeatherMapModel openWeatherMapModelFromJson(String str) =>
    OpenWeatherMapModel.fromJson(json.decode(str));

class OpenWeatherMapModel {
  OpenWeatherMapModel({
    this.cnt,
    this.list,
  });

  double? cnt;
  List<ListElement>? list;

  factory OpenWeatherMapModel.fromJson(Map<String, dynamic> json) =>
      OpenWeatherMapModel(
        cnt: double.parse(json["cnt"].toString()),
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );
}

class ListElement {
  ListElement({
    this.coord,
    this.sys,
    this.weather,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.id,
    this.name,
  });

  Coord? coord;
  Sys? sys;
  List<Weather>? weather;
  Main? main;
  double? visibility;
  Wind? wind;
  Clouds? clouds;
  double? dt;
  double? id;
  String? name;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        coord: Coord.fromJson(json["coord"]),
        sys: Sys.fromJson(json["sys"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        visibility: double.parse(json["visibility"].toString()),
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: double.parse(json["dt"].toString()),
        id: double.parse(json["id"].toString()),
        name: json["name"],
      );
}

class Clouds {
  Clouds({
    this.all,
  });

  int? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  double? lon;
  double? lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  double? pressure;
  double? humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: double.parse(json["pressure"].toString()),
        humidity: double.parse(json["humidity"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Sys {
  Sys({
    this.country,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  String? country;
  double? timezone;
  double? sunrise;
  double? sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
        timezone: double.parse(json["timezone"].toString()),
        sunrise: double.parse(json["sunrise"].toString()),
        sunset: double.parse(json["sunset"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  double? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: double.parse(json["id"].toString()),
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  double? speed;
  double? deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: double.parse(json["speed"].toString()),
        deg: double.parse(json["deg"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
