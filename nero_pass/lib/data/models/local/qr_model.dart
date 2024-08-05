// To parse this JSON data, do
//
//     final qrModel = qrModelFromJson(jsonString);

import 'dart:convert';

QrModel qrModelFromJson(String str) => QrModel.fromJson(json.decode(str));

String qrModelToJson(QrModel data) => json.encode(data.toJson());

class QrModel {
  String id;
  String name;
  String origin;

  QrModel({
    required this.id,
    required this.name,
    required this.origin,
  });

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "origin": origin,
      };
}
