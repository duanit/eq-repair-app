import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api_client.dart';
import '../../models/category.dart';
import 'booking_state.dart';
import 'package:go_router/go_router.dart';

class DamageStep extends ConsumerStatefulWidget {
  const DamageStep({super.key});
  @override
  ConsumerState<DamageStep> createState() => _State();
}

class _State extends ConsumerState<DamageStep> {
  List<DamageCategory> cats = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    () async {
      try {
        final res = await dio.get('/catalog/damage-categories');
        final list = (res.data['data'] as List).map((e)=> DamageCategory.fromJson(e)).toList();
        setState(()=> cats = list);
      } catch (e) {
        // ignore
      } finally {
        setState(()=> loading = false);
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    final booking = ref.watch(bookingProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('ขั้น 2/4: เลือกความเสียหาย')),
      body: loading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: cats.length,
        itemBuilder: (_, i){
          final c = cats[i];
          return Card(
            child: ListTile(
              title: Text(c.name),
              subtitle: Text('หน่วย: ${c.unitType} — ราคาเริ่ม ${c.defaultPrice}'),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  final qtyCtrl = TextEditingController(text: '1');
                  final areaCtrl = TextEditingController(text: '0');
                  String severity = 'low';
                  await showDialog(context: context, builder: (_) {
                    return AlertDialog(
                      title: Text('เพิ่ม ${c.name}'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (c.unitType == 'item')
                            TextField(controller: qtyCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'จำนวน (ชิ้น)')),
                          if (c.unitType == 'm2')
                            TextField(controller: areaCtrl, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'พื้นที่ (ตรม.)')),
                          DropdownButton<String>(
                            value: severity,
                            items: const [
                              DropdownMenuItem(value: 'low', child: Text('เบา')),
                              DropdownMenuItem(value: 'med', child: Text('กลาง')),
                              DropdownMenuItem(value: 'high', child: Text('หนัก')),
                            ],
                            onChanged: (v){ severity = v ?? 'low'; setState((){}); },
                          )
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: ()=> Navigator.pop(context), child: const Text('ยกเลิก')),
                        ElevatedButton(onPressed: (){
                          ref.read(bookingProvider.notifier).addItem({
                            'category_id': c.id,
                            'name': c.name,
                            'unit_type': c.unitType,
                            'qty': int.tryParse(qtyCtrl.text) ?? 1,
                            'area_m2': double.tryParse(areaCtrl.text) ?? 0.0,
                            'severity': severity,
                          });
                          Navigator.pop(context);
                        }, child: const Text('เพิ่ม'))
                      ],
                    );
                  });
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (booking.items.isNotEmpty)
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: booking.items.length,
                  itemBuilder: (_, i){
                    final it = booking.items[i];
                    return Chip(
                      label: Text('${it['name']} ${it['unit_type']=='m2' ? "${it['area_m2']} ตรม." : "${it['qty']} ชิ้น"}'),
                      onDeleted: ()=> ref.read(bookingProvider.notifier).removeItem(i),
                    );
                  },
                ),
              ),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: ()=> context.go('/booking/calendar'), child: const Text('ถัดไป')))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
