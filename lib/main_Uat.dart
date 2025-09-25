import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

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
        fontFamily: 'Tahoma',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w700, color: _AppColors.ink),
          titleMedium: TextStyle(fontWeight: FontWeight.w700, color: _AppColors.ink),
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final double cardSize = (constraints.maxWidth - 16) / 2;
                      return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _MenuCard(
                            size: cardSize,
                            label: 'จองคิว',
                            pngAsset: 'assets/icons/png/calendar_check.png',
                            svgAsset: 'assets/icons/svg/calendar_check.svg',
                          ),
                          _MenuCard(
                            size: cardSize,
                            label: 'ประเมินราคา',
                            // pngAsset: 'assets/icons/png/clipboard_check.png',
                            // svgAsset: 'assets/icons/svg/clipboard_check.svg',
                              pngAsset: 'assets/icons/png/calendar_check.png',
                            svgAsset: 'assets/icons/svg/calendar_check.svg',
                          ),
                          _MenuCard(
                            size: cardSize,
                            label: 'ออกแบบ',
                            // pngAsset: 'assets/icons/png/pencil_design.png',
                            // svgAsset: 'assets/icons/svg/pencil_design.svg',
                              pngAsset: 'assets/icons/png/calendar_check.png',
                            svgAsset: 'assets/icons/svg/calendar_check.svg',
                          ),
                          _MenuCard(
                            size: cardSize,
                            label: 'ก่อสร้าง',
                            // pngAsset: 'assets/icons/png/building_construct.png',
                            // svgAsset: 'assets/icons/svg/building_construct.svg',
                              pngAsset: 'assets/icons/png/calendar_check.png',
                            svgAsset: 'assets/icons/svg/calendar_check.svg',
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
}

class _TopBanner extends StatelessWidget {
  const _TopBanner();

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
    child : Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'THE NINE DESIGN\nCORPORATION',
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                fontWeight: FontWeight.w500,
                letterSpacing: 1.4,
                height: 1.15,
                color: const Color(0xFF2B2F33),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            Text(
            'บริการบิ้วอินสำหรับ\nคอนโดในกรุงเทพฯ',
            textAlign: TextAlign.center,
            style: GoogleFonts.prompt(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              height: 1.25,
              color: _AppColors.ink.withOpacity(0.80),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ประเมินราคาสำหรับงานตกแต่งภายใน',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: _AppColors.ink.withOpacity(0.75),
                ),
          ),
          ],
        ),
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
                  color: Colors.black54.withOpacity(0.12),
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
  final String pngAsset;
  final String svgAsset;
  final double size;

  const _MenuCard({
    required this.label,
    required this.pngAsset,
    required this.svgAsset,
    this.size = 160,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: _GlassCard(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('เปิดหน้าจอ: $label'), behavior: SnackBarBehavior.floating),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  
                  // colors: [Color(0xFFD4888B),Color.fromARGB(255, 199, 122, 124)],
                  colors: [Color.fromARGB(190, 207, 161, 162),Color.fromARGB(189, 170, 136, 137)],
                  //  colors: [Color.fromARGB(189, 170, 136, 137), Color.fromARGB(190, 207, 161, 162)],
                  // colors: [Color.fromARGB(255, 159, 127, 58), Color.fromARGB(255, 126, 95, 9)],
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
              // --- PNG by default ---
              child: Padding(
                padding: const EdgeInsets.all(.1),
                child: Image.asset(pngAsset, fit: BoxFit.contain),
              ),
              // --- Switch to SVG: comment the Image.asset above and uncomment below ---
              // child: Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: SvgPicture.asset(svgAsset, fit: BoxFit.contain),
              // ),
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
        color: _AppColors.rose,
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
        border: Border.all(color: Colors.white.withOpacity(0.45), width: 1),
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
  static const bgGrey  = Color(0x8054575C); // เทาเข้มสวย/น่าเชื่อถือ
  static const rose    = Color(0xBFF8C7C8); // ชมพูอมเทา การ์ด
  static const gold    = Color(0xFFC9A34E);
  static const goldSoft= Color(0xFFE4C777);
  static const ink     = Color(0xFF2B2F33);
  static const pinkgold     = Color(0xFFD4888B);
}
