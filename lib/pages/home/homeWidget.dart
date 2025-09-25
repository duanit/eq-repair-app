import 'package:flutter/material.dart';

// class _HeaderCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   const _HeaderCard({required this.title, required this.subtitle});
  class HeaderCard extends StatefulWidget {
     final String title;
  final String subtitle;
  const HeaderCard({required this.title, required this.subtitle});

  @override
  _HeaderCardState createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'THE NINE DESIGN\nCORPORATION',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.4,
                    color: cs.onPrimary,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    height: 1.25,
                    color: cs.onPrimary,
                  ),
            ),
            const SizedBox(height: 10),
            Text(widget.subtitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: cs.onPrimary.withOpacity(0.85),
                    )),
          ],
        ),
      ),
    );
  }
}


class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const FeatureTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 16 * 2 - 12) / 2,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GoldIcon(icon: icon),
              const SizedBox(height: 10),
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: cs.onPrimary, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoldIcon extends StatelessWidget {
  final IconData icon;
  const GoldIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFC9A45C);
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(offset: Offset(0, 3), blurRadius: 6, color: Colors.black26),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black.withOpacity(0.35), width: 1.4),
        ),
        child: Icon(icon, size: 42, color: gold),
      ),
    );
  }
}
