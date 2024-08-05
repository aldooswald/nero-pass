import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nero_pass/data/models/remote/attendance_model.dart';
import 'package:nero_pass/data/repositories/history_repository.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  final HistoryRepository repository;
  AttendanceCubit({required this.repository}) : super(AttendanceInitial());

  void inputAttendance(String code) async {
    emit(AttendanceLoading());

    try {
      final Map<String, dynamic> data = jsonDecode(code);
      final String id = data['id'] ?? 'Unknown';
      final String name = data['name'] ?? 'Unknown';
      final String origin = data['origin'] ?? 'Unknown';

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd/MM/yyyy - HH:mm:ss');
      final String time = formatter.format(now);

      final result = await repository.addAttendance(id, name, origin, time);

      result.fold((l) => emit(AttendanceError(message: l)),
          (r) => emit(AttendanceLoaded(attendance: r)));
    } catch (e) {
      emit(AttendanceError(message: 'Failed to parse QR code data'));
    }
  }
}
