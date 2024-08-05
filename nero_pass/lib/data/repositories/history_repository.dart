import 'package:dartz/dartz.dart';
import 'package:nero_pass/data/models/remote/attendance_model.dart';
import 'package:nero_pass/data/models/remote/history_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class HistoryRepository {
  final url =
      'https://script.google.com/macros/s/AKfycbyztRAipZg-vqNQ0g4s1-EUJcwIVkBX3Y_wUAyUTN_oJYr8s0NSlYitwd_IgvaD45A/exec';

  Future<Either<String, HistoryModel>> getHistory() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final historyModel = HistoryModel.fromJson(jsonDecode(response.body));
        return Right(historyModel);
      } else {
        return Left('Failed to load history: ${response.reasonPhrase}');
      }
    } catch (e) {
      return Left('Failed to load history $e');
    }
  }

  // Future<Either<String, String>> addAttendance(
  //     String id, String name, String origin, String time) async {
  //   try {
  //     final response = await dio.post(
  //       url,
  //       data: {
  //         'id': id,
  //         'name': name,
  //         'origin': origin,
  //         'time': time,
  //       },
  //     );

  //     print('Response status code: ${response.statusCode}');
  //     print('Response data: ${response.data}');

  //     if (response.statusCode == 200) {
  //       final data = AttendanceModel.fromJson(response.data);
  //       final name = data.name;
  //       return Right(name);
  //     } else {
  //       return Left('Failed to post data: ${response.statusMessage}');
  //     }
  //   } catch (e, stackTrace) {
  //     print('Exception occurred: $e');
  //     print('Stack trace: $stackTrace');
  //     return Left('Failed to post data catch: $e');
  //   }
  // }

  Future<Either<String, AttendanceModel>> addAttendance(
      String id, String name, String origin, String time) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': id,
          'name': name,
          'origin': origin,
          'time': time,
        }),
      );

      if (response.statusCode == 200) {
        final data = AttendanceModel.fromJson(jsonDecode(response.body));

        return Right(data);
      } else if (response.statusCode == 302) {
        final redirectUrl = response.headers['location'];

        // Make a GET request to the redirected URL
        final redirectedResponse = await http.get(Uri.parse(redirectUrl!));

        if (redirectedResponse.statusCode == 200) {
          final data =
              AttendanceModel.fromJson(jsonDecode(redirectedResponse.body));
          final name = data.name;
          return Right(data);
        } else {
          return Left(
              'Failed to follow redirection: ${redirectedResponse.reasonPhrase}');
        }
      } else {
        return Left('Failed to post data: ${response.reasonPhrase}');
      }
    } catch (e) {
      return Left('Failed to post data catch: $e');
    }
  }
}
