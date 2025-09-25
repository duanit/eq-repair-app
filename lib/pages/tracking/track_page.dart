import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api_client.dart';

class TrackPage extends ConsumerStatefulWidget {
  const TrackPage({super.key});
  @override
  ConsumerState<TrackPage> createState() => _State();
}

class _State extends ConsumerState<TrackPage> {
  final _ctrl = TextEditingController();
  Map? data;

  Future<void> fetch() async {
    if (_ctrl.text.isEmpty) return;
    try {
      final res = await dio.get('/appointments/${_ctrl.text}');
      setState(()=> data = res.data['data'] as Map);
    } catch (_) {
      setState(()=> data = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ติดตามงาน')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _ctrl, decoration: const InputDecoration(labelText: 'ใส่เลขที่นัดหมาย')),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: fetch, child: const Text('ตรวจสอบ')),
            const SizedBox(height: 16),
            if (data != null) ...[
              Text('สถานะ: ${data!['appointment']['status']}'),
              const SizedBox(height: 8),
              const Divider(),
              const Align(alignment: Alignment.centerLeft, child: Text('รายการตรวจพบ:')),
              Expanded(
                child: ListView(
                  children: (data!['damage_reports'] as List).map((e)=> ListTile(
                    title: Text(e['category_name']??'-'),
                    subtitle: Text('severity: ${e['severity']}  prelim: ${e['prelim_price']}'),
                  )).toList(),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
