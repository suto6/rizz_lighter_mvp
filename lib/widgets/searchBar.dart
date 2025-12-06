import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class LighterSearchBar extends StatelessWidget {
  const LighterSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.deepIndigo.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: AppColors.brightCleanYellow.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppColors.softCharcoal),
          hintText: "Search your latest lassos...",
          hintStyle: TextStyle(color: AppColors.softCharcoal),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}