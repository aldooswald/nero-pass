import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nero_pass/config/themes.dart';

class ClockAndDateWidget extends StatefulWidget {
  const ClockAndDateWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClockAndDateWidgetState createState() => _ClockAndDateWidgetState();
}

class _ClockAndDateWidgetState extends State<ClockAndDateWidget> {
  late Timer _timer;
  String _currentTime = _formatTime(DateTime.now());
  String _currentDate = _formatDate(DateTime.now());

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _formatTime(DateTime.now());
        _currentDate = _formatDate(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  static String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  static String _formatDate(DateTime dateTime) {
    return '${_getDayOfWeek(dateTime.weekday)}, ${dateTime.day.toString().padLeft(2, '0')} ${_getMonth(dateTime.month)} ${dateTime.year}';
  }

  static String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  static String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _currentTime,
          style: const TextStyle().semiBold.jumbo.myColor(AppTextColor.primary),
        ),
        Text(
          _currentDate,
          style: const TextStyle().regular.large.myColor(AppTextColor.grey),
        ),
      ],
    );
  }
}
