part of 'attendance_cubit.dart';

@immutable
sealed class AttendanceState {}

final class AttendanceInitial extends AttendanceState {}

final class AttendanceLoading extends AttendanceState {}

final class AttendanceLoaded extends AttendanceState {
  final AttendanceModel attendance;

  AttendanceLoaded({required this.attendance});
}

final class AttendanceError extends AttendanceState {
  final String message;

  AttendanceError({required this.message});
}
