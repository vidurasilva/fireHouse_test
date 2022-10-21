import 'dart:convert';

CityList cityListFromJson(String str) => CityList.fromJson(json.decode(str));

String cityListToJson(CityList data) => json.encode(data.toJson());

class CityList {
  CityList({
    this.list,
  });

  List<CityElement>? list;

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        list: List<CityElement>.from(
            json["List"].map((x) => CityElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "List": List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class CityElement {
  CityElement({
    this.cityCode,
    this.cityName,
    this.temp,
    this.status,
  });

  String? cityCode;
  String? cityName;
  String? temp;
  String? status;

  factory CityElement.fromJson(Map<String, dynamic> json) => CityElement(
        cityCode: json["CityCode"],
        cityName: json["CityName"],
        temp: json["Temp"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "CityCode": cityCode,
        "CityName": cityName,
        "Temp": temp,
        "Status": status,
      };
}
