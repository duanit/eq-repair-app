class TimeSlot {
  final int id;
  final DateTime date;
  final String start;
  final String end;
  final int total;
  final int reserved;
  int get left => total - reserved;

  TimeSlot({required this.id, required this.date, required this.start, required this.end, required this.total, required this.reserved});

  factory TimeSlot.fromJson(Map<String, dynamic> j) => TimeSlot(
    id: j['id'],
    date: DateTime.parse(j['date']),
    start: j['start_time'],
    end: j['end_time'],
    total: j['capacity_total'],
    reserved: j['capacity_reserved'],
  );
}
