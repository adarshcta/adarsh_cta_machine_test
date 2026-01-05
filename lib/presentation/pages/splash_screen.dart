import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/constants.dart';
import '../widgets/bottom_nav_bar.dart'; // Will be created next

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Random splash text or background logic can go here if needed.
    // Requirement: "add a random splash screen that matches the theme and tone"
    final List<String> splashTexts = [
      "Welcome to Great Deals",
      "Exclusive Offers For You",
      "Savings Everyday",
    ];
    final randomText = splashTexts[Random().nextInt(splashTexts.length)];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using a logo if available, else text
            Image.asset(AppAssets.vlccLogo, height: 100), // Placeholder logo
            const SizedBox(height: 20),
            Text(
              randomText,
              style: GoogleFonts.outfit(
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
