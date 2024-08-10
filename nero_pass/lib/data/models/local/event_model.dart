// models/event_model.dart

class EventModel {
  final String name;
  final String imageUrl;

  EventModel({
    required this.name,
    required this.imageUrl,
  });

  // Static list of example events
  static final List<EventModel> getEvents = [
    EventModel(
        name: 'One Peace', imageUrl: 'assets/images/events/one_peace.jpg'),
    // EventModel(
    //     name: 'Nirankara 2024', imageUrl: 'assets/images/events/one_peace.jpg'),
  ];
}
