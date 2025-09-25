import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'booking_state.dart';
import '../../core/api_client.dart';
import 'package:go_router/go_router.dart';

class ReviewStep extends ConsumerWidget {
  const ReviewStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final st = ref.watch(bookingProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('ขั้น 4/4: ทบทวน & ยืนยัน')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ที่อยู่: ${st.address ?? '-'}'),
            const SizedBox(height: 12),
            const Text('รายการความเสียหาย:'),
            const SizedBox(height: 8),
            ...st.items.map((e)=> Text('- ${e['name']} (${e['unit_type']=='m2' ? '${e['area_m2']} ตรม.' : '${e['qty']} ชิ้น'})')),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                try {
                  // For demo: public booking (no auth). If API requires token, add via headers.
                  final res = await dio.post('/appointments', data: {
                    'unit_id': null,
                    'slot_id': st.slotId,
                    'notes': st.address,
                    'damage_items': st.items,
                  }, options: Options(headers: {'Authorization': ''}));
                  final id = res.data['id'].toString();
                  ref.read(bookingProvider.notifier).clear();
                  if (context.mounted) context.go('/booking/success/$id');
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('บันทึกไม่สำเร็จ')));
                  }
                }
              },
              child: const Text('ยืนยันการจอง'),
            )
          ],
        ),
      ),
    );
  }
}
