import 'package:eq_repair_app/pages/estimate/estimatePage.dart';
import 'package:eq_repair_app/pages/home/homeWidget.dart';
import 'package:eq_repair_app/pages/home/homepage.dart';
import 'package:eq_repair_app/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const NineDesignApp());

class NineDesignApp extends StatelessWidget {
  const NineDesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    const pink = Color(0xBFF8C7C8); // dusty pink card
    const charcoal = Color(0x8054575C); // dark grey bg
    const gunmetal = Color(0xFF2B2F33); // deeper grey for scaffold
    const gold = Color(0xFFC9A34E); // soft gold accent

    final baseTextTheme = GoogleFonts.promptTextTheme();
    final displayFont = GoogleFonts.cinzel().fontFamily;

    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: gunmetal,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: pink,
        onPrimary: const Color(0xFF2B2B2B),
        secondary: gold,
        onSecondary: Colors.black,
        surface: charcoal,
        onSurface: Colors.white,
        background: gunmetal,
        onBackground: Colors.white,
        error: const Color(0xFFEF5350),
        onError: Colors.white,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.cinzel(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
        titleLarge: GoogleFonts.cinzel(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardTheme(
        color: pink,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        margin: const EdgeInsets.all(14),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: charcoal,
        foregroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: baseTextTheme.titleLarge?.copyWith(
          fontFamily: displayFont,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: charcoal,
        selectedItemColor: pink,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: baseTextTheme.labelMedium,
        unselectedLabelStyle: baseTextTheme.labelMedium,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Nine Design',
      theme: theme,
      home: const _Root(),
    );
  }
}

class _Root extends StatefulWidget {
  const _Root({super.key});

  @override
  State<_Root> createState() => _RootState();
}

class _RootState extends State<_Root> {
  int _index = 0;
  final _pages =  [HomePage(), EstimatePage(), DesignPage(), BuildPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('THE NINE DESIGN')),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'หน้าหลัก'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money_rounded), label: 'ประเมินราคา'),
          BottomNavigationBarItem(icon: Icon(Icons.brush_rounded), label: 'ออกแบบ'),
          BottomNavigationBarItem(icon: Icon(Icons.apartment_rounded), label: 'ก่อสร้าง'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'โปรไฟล์'),
        ],
      ),
    );
  }
}



class DesignPage extends StatelessWidget {
  const DesignPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const CenterText('ออกแบบ');
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const CenterText('ก่อสร้าง');
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const CenterText('โปรไฟล์');
  }
}

