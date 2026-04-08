import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_theme.dart';
import '../../../core/haptics.dart';

class RewardsView extends StatelessWidget {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "ECO REWARDS",
          style: GoogleFonts.spaceGrotesk(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppTheme.primaryContainer,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tier Card
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryContainer.withOpacity(0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.military_tech, color: Colors.white, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          "SILVER TIER RESIDENT",
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Your EcoPoints: 1,240",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.onPrimary,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "260 pts to Gold Tier",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.onPrimary.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        "82%",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.82,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      color: Colors.white,
                      minHeight: 12,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            Text(
              "EARNED BADGES",
              style: GoogleFonts.spaceGrotesk(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: AppTheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _BadgeItem(icon: Icons.local_florist, label: "First Pickup 🌱"),
                  SizedBox(width: 16),
                  _BadgeItem(icon: Icons.calendar_today, label: "7-day Streak ♻️"),
                  SizedBox(width: 16),
                  _BadgeItem(icon: Icons.language, label: "100kg Diverted 🌍"),
                  SizedBox(width: 16),
                  _BadgeItem(icon: Icons.bolt, label: "30-day Active ⚡", isLocked: true),
                ],
              ),
            ),
            
            const SizedBox(height: 48),
            // Coming Soon Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              decoration: BoxDecoration(
                color: AppTheme.surfaceContainerLowest.withOpacity(0.5),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  const Icon(Icons.forest, size: 80, color: AppTheme.primaryContainer),
                  const SizedBox(height: 24),
                  Text(
                    "REWARDS COMING SOON",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color: AppTheme.primaryNeon,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Our digital ecosystem is evolving. New high-tech sustainable rewards are being curated for your district.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      height: 1.6,
                      color: AppTheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isLocked;

  const _BadgeItem({required this.icon, required this.label, this.isLocked = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isLocked) AppHaptics.lightImpact();
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isLocked ? Theme.of(context).colorScheme.surfaceContainerLow : Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isLocked ? Colors.transparent : Theme.of(context).colorScheme.primary.withOpacity(0.2)),
            ),
            child: Icon(
              icon,
              size: 32,
              color: isLocked ? AppTheme.onSurfaceVariant.withOpacity(0.3) : AppTheme.primaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 80,
            child: Text(
              label.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: isLocked ? AppTheme.onSurfaceVariant.withOpacity(0.3) : AppTheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
