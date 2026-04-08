import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/haptics.dart';

class LocationPermissionView extends StatefulWidget {
  const LocationPermissionView({super.key});

  @override
  State<LocationPermissionView> createState() => _LocationPermissionViewState();
}

class _LocationPermissionViewState extends State<LocationPermissionView> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cs.primary.withOpacity(0.03),
              ),
            ),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                children: [
                  const Spacer(),
                  
                  // Hero Pin Illustration
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Ripple rings
                        ScaleTransition(
                          scale: _pulseAnimation,
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: cs.primary.withOpacity(0.05),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: cs.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: cs.primary.withOpacity(0.3),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.location_on,
                            size: 48,
                            color: cs.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 60),
                  
                  Text(
                    "ALLOW LOCATION ACCESS",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "We use your location to match you with the nearest collector and send accurate proximity alerts.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      height: 1.6,
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  
                  const Spacer(),
                  
                  ElevatedButton(
                    onPressed: () {
                      AppHaptics.mediumImpact();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 64),
                    ),
                    child: const Text("ALLOW LOCATION"),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      AppHaptics.lightImpact();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "MAYBE LATER",
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  Text(
                    "SECURE 256-BIT ENCRYPTED GEO-DATA",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: cs.outlineVariant.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
