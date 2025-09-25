import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'pages/booking/address_step.dart';
import 'pages/booking/damage_step.dart';
import 'pages/booking/calendar_step.dart';
import 'pages/booking/review_step.dart';
import 'pages/booking/success_page.dart';
import 'pages/tracking/track_page.dart';
import 'pages/inspector/assignments_page.dart';
import 'pages/inspector/report_form_page.dart';
import 'package:flutter/cupertino.dart';




void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Nine Design – Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _AppColors.gold,
          primary: _AppColors.gold,
          background: _AppColors.bgGrey,
        ),
        fontFamily: 'Tahoma', // Thai-friendly default (no extra package needed)
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: _AppColors.ink,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: _AppColors.ink,
          ),
          bodyLarge: TextStyle(color: _AppColors.ink),
          bodyMedium: TextStyle(color: _AppColors.ink),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.bgGrey,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _TopBanner(),
                  const SizedBox(height: 16),
                  // 2x2 grid of menu cards
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final double cardSize = (constraints.maxWidth - 16) / 2; // 8 px gap between
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _MenuCard(
                            size: cardSize,
                            label: 'จองคิว',
                            icon: Icons.event_available_outlined,
                            onTap: () => _debugAction(context, 'จองคิว'),
                          ),
                          _MenuCard(
                            size: cardSize,
                            label: 'ประเมินราคา',
                            icon: Icons.assignment_turned_in_outlined,
                            onTap: () => _debugAction(context, 'ประเมินราคา'),
                          ),
                          _MenuCard(
                            size: cardSize,
                            label: 'ออกแบบ',
                            icon: Icons.architecture,
                            onTap: () => _debugAction(context, 'ออกแบบ'),
                          ),
                          _MenuCard(
                            size: cardSize,
                            label: 'ก่อสร้าง',
                            icon: Icons.home_work_outlined,
                            onTap: () => _debugAction(context, 'ก่อสร้าง'),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const _BottomPromo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void _debugAction(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('เปิดหน้าจอ: $name'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _AppColors.gold,
      ),
    );
  }
}

class _TopBanner extends StatelessWidget {
  const _TopBanner();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE NINE DESIGN\nCORPORATION',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  letterSpacing: 1.2,
                  color: _AppColors.ink.withOpacity(0.85),
                ),
          ),
          const SizedBox(height: 10),
          Text(
            'บริการบิ้วอิน • ออกแบบตกแต่งภายใน • ประเมินราคาหน้างาน',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: _AppColors.ink.withOpacity(0.75),
                ),
          ),
        ],
      ),
    );
  }
}

class _BottomPromo extends StatelessWidget {
  const _BottomPromo();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      child: Row(
        children: [
          // Promo badge circle
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [_AppColors.gold, _AppColors.goldSoft],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(Icons.local_offer_outlined, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ส่วนลดพิเศษสำหรับงานตกแต่ง',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: _AppColors.ink,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'จองคิวภายในเดือนนี้ รับส่วนลดสูงสุด 15% สำหรับแพ็กเกจบิ้วอิน',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: _AppColors.ink.withOpacity(0.7),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: _AppColors.gold,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 0,
            ),
            onPressed: () {},
            child: const Text('ดูโปร'),
          )
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final double size;
  final VoidCallback onTap;

  const _MenuCard({
    required this.label,
    required this.icon,
    required this.onTap,
    this.size = 160,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: _GlassCard(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [_AppColors.gold, _AppColors.goldSoft],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 14),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: _AppColors.ink,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable frosted/pink card used in the mockup.
class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const _GlassCard({
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: _AppColors.rose.withOpacity(0.92),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.12),
            blurRadius: 0,
            spreadRadius: 0.5,
            offset: const Offset(-1, -1),
          ),
        ],
        border: Border.all(color: Colors.white.withOpacity(0.55), width: 1),
      ),
      child: child,
    );

    if (onTap == null) return card;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: _AppColors.gold.withOpacity(0.15),
        highlightColor: Colors.white.withOpacity(0.05),
        onTap: onTap,
        child: card,
      ),
    );
  }
}

class _AppColors {
  // Background grey (stylish, trustworthy)
  static const bgGrey = Color(0xFF59616A); // "สีเทาสวยๆ" – refined smoky slate

  // Blush pink card color from the mockup (brandable to The Nine Design)
  static const rose = Color(0xFFF0D2D8); // soft grey‑pink card

  // Gold accents
  static const gold = Color(0xFFC9A34E);
  static const goldSoft = Color(0xFFE4C777);

  // Text
  static const ink = Color(0xFF2B2F33);
}


// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final router = GoRouter(
//       routes: [
//         GoRoute(path: '/', builder: (_, __) =>  HomeMenuMinimalPage()),
//         GoRoute(path: '/booking/address', builder: (_, __) => const AddressStep()),
//         GoRoute(path: '/booking/damage', builder: (_, __) => const DamageStep()),
//         GoRoute(path: '/booking/calendar', builder: (_, __) => const CalendarStep()),
//         GoRoute(path: '/booking/review', builder: (_, __) => const ReviewStep()),
//         GoRoute(path: '/booking/success/:id', builder: (_, st) => SuccessPage(id: st.pathParameters['id']!)),
//         GoRoute(path: '/track', builder: (_, __) => const TrackPage()),
//         GoRoute(path: '/inspector/assignments', builder: (_, __) => const AssignmentsPage()),
//         GoRoute(path: '/inspector/report', builder: (_, __) => const ReportFormPage()),
//       ],
//     );

//     return MaterialApp.router(
//       title: 'EQ Repair',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFe91e63)),
//         useMaterial3: true,
//       ),
//       routerConfig: router,
//     );
//   }
// }


// class HomeMenuMinimalPage extends StatelessWidget {
//   final List<MenuItem> menuItems = [
//     MenuItem("ชำระบิล", CupertinoIcons.doc_text, Colors.black87),
//     MenuItem("เติมเงิน", CupertinoIcons.creditcard, Colors.black87),
//     MenuItem("ประวัติ", CupertinoIcons.time, Colors.black87),
//     MenuItem("คูปอง", CupertinoIcons.gift, Colors.black87),
//     MenuItem("อุปกรณ์", CupertinoIcons.device_phone_portrait, Colors.black87),
//     MenuItem("การตั้งค่า", CupertinoIcons.gear, Colors.black87),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "จองคิว",
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: GridView.count(
//           crossAxisCount: 3, // 3 เมนูต่อแถว เหมือน Home Screen iOS
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20,
//           children: menuItems.map((item) {
//             return GestureDetector(
//               onTap: () {
//                 print("ไปยัง ${item.title}");
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 70,
//                     width: 70,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Icon(
//                       item.icon,
//                       size: 30,
//                       color: item.color,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     item.title,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class MenuItem {
//   final String title;
//   final IconData icon;
//   final Color color;

//   MenuItem(this.title, this.icon, this.color);
// }




// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('จองคิวซ่อมแซม (แผ่นดินไหว)')),
//       body: Center(
//         child: Wrap(
//           spacing: 12,
//           runSpacing: 12,
//           children: [
//             ElevatedButton(
//               onPressed: ()=> context.go('/booking/address'),
//               child: const Text('เริ่มจองคิว 4 ขั้น'),
//             ),
//             ElevatedButton(
//               onPressed: ()=> context.go('/track'),
//               child: const Text('ติดตามงาน'),
//             ),
//             ElevatedButton(
//               onPressed: ()=> context.go('/inspector/assignments'),
//               child: const Text('Inspector Mode'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
