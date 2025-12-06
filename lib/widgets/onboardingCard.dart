import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.creamyOffWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepIndigo.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Placeholder for Octy Image
          const Icon(
            Icons.favorite, // Placeholder for the Octy Mascot Image
            size: 80,
            color: AppColors.deepIndigo,
          ),
          const SizedBox(height: 10),
          const Text(
            "Octy Needs the Rizz to Lasso!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.deepIndigo,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "To grab anything from any app, Octy needs to float over your screen. Chill, we only save what you specifically lasso!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.softCharcoal,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement permission request logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepIndigo,
              foregroundColor: AppColors.brightCleanYellow,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Enable Octy's Lasso",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Why? Learn more",
              style: TextStyle(color: AppColors.deepIndigo),
            ),
          ),
        ],
      ),
    );
  }
}