import 'package:flutter/material.dart';
import 'package:nero_pass/config/themes.dart';
import 'package:nero_pass/data/models/local/event_model.dart';
import 'package:nero_pass/presentation/widget/event_widget.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildEventList(EventModel.getEvents)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nerosia Events',
                style: const TextStyle()
                    .semiBold
                    .large
                    .myColor(AppTextColor.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventList(List<EventModel> events) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 16.0, // Space between columns
        mainAxisSpacing: 16.0, // Space between rows
        childAspectRatio: 0.75, // Adjust as needed to fit your layout
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventWidget(
          name: event.name,
          imageUrl: event.imageUrl,
        );
      },
    );
  }
}
