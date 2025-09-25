import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'booking_state.dart';

class AddressStep extends ConsumerStatefulWidget {
  const AddressStep({super.key});
  @override
  ConsumerState<AddressStep> createState() => _State();
}

class _State extends ConsumerState<AddressStep> {
  final _ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ขั้น 1/4: ที่อยู่/ข้อมูลหน่วย')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _ctrl, decoration: const InputDecoration(labelText: 'ที่อยู่/คอนโด/ตึก/ห้อง')),
            const Spacer(),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: (){ ref.read(bookingProvider.notifier).setAddress(_ctrl.text); context.go('/booking/damage'); }, child: const Text('ถัดไป'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
