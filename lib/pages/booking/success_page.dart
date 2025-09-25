import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String id;
  const SuccessPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('จองสำเร็จ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 72),
            const SizedBox(height: 12),
            Text('เลขที่นัดหมาย: #$id'),
            const SizedBox(height: 24),
            const Text('ติดตามสถานะได้ที่เมนู "ติดตามงาน"'),
          ],
        ),
      ),
    );
  }
}
