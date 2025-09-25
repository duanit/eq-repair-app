import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api_client.dart';

class ReportFormPage extends StatefulWidget {
  const ReportFormPage({super.key});
  @override
  State<ReportFormPage> createState() => _State();
}

class _State extends State<ReportFormPage> {
  final apptIdCtrl = TextEditingController();
  final catIdCtrl = TextEditingController();
  final qtyCtrl = TextEditingController(text: '1');
  final areaCtrl = TextEditingController(text: '0');
  String severity = 'low';

  Future<void> submit() async {
    try {
      await dio.post('/inspector/appointments/${apptIdCtrl.text}/report', data: {
        'items':[{
          'category_id': int.tryParse(catIdCtrl.text),
          'qty': int.tryParse(qtyCtrl.text),
          'area_m2': double.tryParse(areaCtrl.text),
          'severity': severity,
          'remarks': null
        }]
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('บันทึกแล้ว')));
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ผิดพลาด')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ส่งรายงานหน้างาน (Demo)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: apptIdCtrl, decoration: const InputDecoration(labelText: 'เลขนัดหมาย')),
            TextField(controller: catIdCtrl, decoration: const InputDecoration(labelText: 'หมวด (category_id)')),
            TextField(controller: qtyCtrl, decoration: const InputDecoration(labelText: 'จำนวน (ถ้า unit=item)')),
            TextField(controller: areaCtrl, decoration: const InputDecoration(labelText: 'พื้นที่ ตรม. (ถ้า unit=m2)')),
            DropdownButton<String>(
              value: severity,
              onChanged: (v)=> setState(()=> severity = v ?? 'low'),
              items: const [
                DropdownMenuItem(value: 'low', child: Text('low')),
                DropdownMenuItem(value: 'med', child: Text('med')),
                DropdownMenuItem(value: 'high', child: Text('high')),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: submit, child: const Text('ส่งรายงาน')),
          ],
        ),
      ),
    );
  }
}
