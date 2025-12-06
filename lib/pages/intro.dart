import 'package:flutter/material.dart';

import '../utils/app_constant.dart';
import 'home.dart' show LighterHomePage;

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  void _navigateToHomePage(BuildContext context) {
    // Navigates to the home page and replaces the intro page so the user
    // can't press back to return to the onboarding screen.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LighterHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The background color is the creamy off-white color
      backgroundColor: AppColors.creamyOffWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // --- Octy Mascot Image ---
              // Placeholder for the Octy Mascot Image
              Image.asset(
                'assets/images/octyIntro.png', // your image path
                width: 380,
                height: 380,
                // fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),

              // --- Main Headline ---
              const Text(
                "Octy Needs the\nRizz to Lasso!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppColors.deepIndigo,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 25),

              // --- Body Description ---
              const Text(
                "To grab anything from any app (Insta, TikTok, etc.), Octy needs to float over your screen. Chill, we only save what you specifically lasso!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.softCharcoal,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 50),

              // --- "Enable Octy's Lasso" Button ---
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      _navigateToHomePage(context), // Navigation logic
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepIndigo,
                    foregroundColor: AppColors.creamyOffWhite,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Enable Octy's Lasso",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- "Why? Learn more" Text Button ---
              TextButton(
                onPressed: () {
                  // TODO: Implement logic to open a modal or new page explaining permissions
                },
                child: const Text(
                  "Why? Learn more",
                  style: TextStyle(
                    color: AppColors.deepIndigo,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
