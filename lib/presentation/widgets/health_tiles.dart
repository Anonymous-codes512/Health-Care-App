import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  const HealthTile({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 165,
        height: 160,

        decoration: BoxDecoration(
          color: const Color(0xFFcad2ee),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class LargeHealthTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final List<Widget> stepsIcons;
  final VoidCallback? onTap;

  const LargeHealthTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.stepsIcons,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFFcad2ee),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            Row(children: [icon, const SizedBox(width: 12), ...stepsIcons]),
          ],
        ),
      ),
    );
  }
}
