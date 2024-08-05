// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) =>
    json.encode(data.toJson());

class AttendanceModel {
  String status;
  String message;
  String name;
  String time;

  AttendanceModel({
    required this.status,
    required this.message,
    required this.name,
    required this.time,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        status: json["status"],
        message: json["message"],
        name: json["name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "name": name,
        "time": time,
      };
}
