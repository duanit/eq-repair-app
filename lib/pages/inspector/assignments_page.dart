import 'package:flutter/material.dart';
import '../../core/api_client.dart';

class AssignmentsPage extends StatefulWidget {
  const AssignmentsPage({super.key});
  @override
  State<AssignmentsPage> createState() => _State();
}

class _State extends State<AssignmentsPage> {
  List items = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    () async {
      try {
        // For demo, no auth header; in real app, include Bearer token for inspector
        final res = await dio.get('/inspector/assignments');
        setState(()=> items = res.data['data'] as List);
      } catch (_) {} finally { setState(()=> loading = false); }
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inspector Assignments')),
      body: loading ? const Center(child: CircularProgressIndicator()) :
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i){
            final it = items[i] as Map;
            return ListTile(
              title: Text('นัดหมาย #${it['id']} ${it['customer_name']??''}'),
              subtitle: Text('เวลา: ${it['scheduled_at']} — สถานะ: ${it['status']}'),
            );
          },
        ),
    );
  }
}
