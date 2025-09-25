import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../models/timeslot.dart';
import '../../core/api_client.dart';
import 'booking_state.dart';
import 'package:go_router/go_router.dart';

class CalendarStep extends ConsumerStatefulWidget {
  const CalendarStep({super.key});
  @override
  ConsumerState<CalendarStep> createState() => _State();
}

class _State extends ConsumerState<CalendarStep> {
  DateTime date = DateTime.now();
  List<TimeSlot> slots = [];
  bool loading = false;

  Future<void> load() async {
    setState(()=> loading = true);
    try {
      final ds = DateFormat('yyyy-MM-dd').format(date);
      final res = await dio.get('/slots/availability', queryParameters: { 'date': ds });
      final list = (res.data['data'] as List).map((e)=> TimeSlot.fromJson(e)).toList();
      setState(()=> slots = list);
    } catch (_) {} finally { setState(()=> loading = false); }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('dd MMM yyyy', 'th');
    final booking = ref.watch(bookingProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('ขั้น 3/4: เลือกช่วงเวลา')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){ setState(()=> date = date.subtract(const Duration(days:1))); load(); }, icon: const Icon(Icons.chevron_left)),
              Text(fmt.format(date)),
              IconButton(onPressed: (){ setState(()=> date = date.add(const Duration(days:1))); load(); }, icon: const Icon(Icons.chevron_right)),
            ],
          ),
          Expanded(
            child: loading ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
              itemCount: slots.length,
              itemBuilder: (_, i){
                final s = slots[i];
                final isFull = s.left <= 0;
                return ListTile(
                  title: Text('${s.start} - ${s.end}'),
                  subtitle: Text('คงเหลือ ${s.left}'),
                  trailing: isFull ? const Chip(label: Text('เต็ม')) : ElevatedButton(
                    onPressed: (){ ref.read(bookingProvider.notifier).setSlot(s.id); context.go('/booking/review'); },
                    child: const Text('จอง'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
