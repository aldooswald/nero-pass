// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  List<HistoryDatum> data;

  HistoryModel({
    required this.data,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        data: List<HistoryDatum>.from(
            json["data"].map((x) => HistoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HistoryDatum {
  String name;
  String origin;
  String time;

  HistoryDatum({
    required this.name,
    required this.origin,
    required this.time,
  });

  factory HistoryDatum.fromJson(Map<String, dynamic> json) => HistoryDatum(
        name: json["name"],
        origin: json["origin"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "origin": origin,
        "time": time,
      };

  String get date {
    final dateTime = DateFormat('dd/MM/yyyy - HH:mm:ss').parse(time);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String get onlyTime {
    final dateTime = DateFormat('dd/MM/yyyy - HH:mm:ss').parse(time);
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}
