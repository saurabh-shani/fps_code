// To parse this JSON data, do
//
//     final fpsListDataModel = fpsListDataModelFromJson(jsonString);

import 'dart:convert';

List<FpsListDataModel> fpsListDataModelFromJson(String str) =>
    List<FpsListDataModel>.from(
        json.decode(str).map((x) => FpsListDataModel.fromJson(x)));

String fpsListDataModelToJson(List<FpsListDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FpsListDataModel {
  FpsListDataModel({
    this.fpsid,
    this.fpslicense,
    this.fpsshopname,
    this.latitude,
    this.longitude,
    this.mobileno,
  });

  String fpsid;
  String fpslicense;
  String fpsshopname;
  String latitude;
  String longitude;
  String mobileno;

  factory FpsListDataModel.fromJson(Map<String, dynamic> json) =>
      FpsListDataModel(
        fpsid: json["fpsid"],
        fpslicense: json["fpslicense"],
        fpsshopname: json["fpsshopname"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        mobileno: json["mobileno"],
      );

  Map<String, dynamic> toJson() => {
        "fpsid": fpsid,
        "fpslicense": fpslicense,
        "fpsshopname": fpsshopname,
        "latitude": latitude,
        "longitude": longitude,
        "mobileno": mobileno,
      };
}
