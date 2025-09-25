import 'package:eq_repair_app/pages/home/homeWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
      children: [
        HeaderCard(
          title: 'บริการบิ้วอินสำหรับ\nคอนโดในกรุงเทพฯ',
          subtitle: 'ประเมินราคาสำหรับงานตกแต่งภายใน',
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            FeatureTile(icon: Icons.check_circle, label: 'จองคิว'),
            FeatureTile(icon: Icons.payments_rounded, label: 'ประเมินราคา'),
            FeatureTile(icon: Icons.design_services_rounded, label: 'ออกแบบ'),
            FeatureTile(icon: Icons.factory_rounded, label: 'ก่อสร้าง'),
          ],
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('ส่วนลดพิเศษสำหรับงานตกแต่ง',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: cs.onPrimary)),
                const SizedBox(height: 8),
                Text(
                  'โปรโมชั่นรับอัปเดตธุรกิจในกรุงเทพ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: cs.onPrimary.withOpacity(0.9)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
