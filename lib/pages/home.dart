import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:rizz_lighter_mvp/pages/intro.dart';
// import 'package:dash_bubble/dash_bubble.dart';
// Assuming these imports are correctly defined in your project
import '../utils/app_constant.dart';
import '../widgets/folderCarousel.dart';
import '../widgets/recentClipCard.dart';
import '../widgets/searchBar.dart'; // LighterSearchBar

class LighterHomePage extends StatefulWidget {
  const LighterHomePage({super.key});

  @override
  State<LighterHomePage> createState() => _LighterHomePageState();
}

class _LighterHomePageState extends State<LighterHomePage> {
  // Note: The original function name was confusing. Renaming to clarify it goes back to IntroPage.
  void _navigateToIntroPage(BuildContext context) {
    // Navigates back to the intro/onboarding page (often used for re-requesting permissions).
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const IntroPage()),
    );
  }

  void _startBubble() async {
    FlutterOverlayWindow.showOverlay(
      height: 100,
      width: 100,
      enableDrag: true,
      alignment: OverlayAlignment.centerRight,
      positionGravity: PositionGravity.auto,
      flag: OverlayFlag.defaultFlag,
    );
  }

  void _stopBubble() async {
    if (await FlutterOverlayWindow.isActive()) {
      FlutterOverlayWindow.closeOverlay();
    }
  }
@override
void initState() {
  super.initState();

  FlutterOverlayWindow.overlayListener.listen((event) {
    if (event == "enable_highlight") {
      _startHighlightMode();
    }
  });
}
void _startHighlightMode() {
  debugPrint("Highlight mode triggered from overlay");

  // NEXT STEP:
  // Call Android Accessibility Service here using MethodChannel
}

  @override
  Widget build(BuildContext context) {
    // Define the mascot size and padding constants
    const double mascotSize = 60.0;
    const double headerBottomRadius = 50.0;
    const double expandedHeaderHeight =
        220.0; // Adjusted for better visual balance

    // Ensure AppColors is defined (assuming it's in app_constant.dart)
    // If not, use the fallback:
    // const Color deepIndigo = Color(0xFF17203A);

    return Scaffold(
      backgroundColor: AppColors.creamyOffWhite,
      body: CustomScrollView(
        slivers: <Widget>[
          // --- 1. The Curved Yellow Header (SliverAppBar) ---
          SliverAppBar(
            backgroundColor: AppColors.brightCleanYellow,
            expandedHeight: expandedHeaderHeight,
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false, // Hide back button if not needed
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.zero,
              // The title of the header, which collapses
              title: const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Octy Grabbed 5 things today.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.deepIndigo,
                  ),
                ),
              ),
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // Placeholder for Octy Mascot
                  Image.asset(
                    'assets/images/octyHome.png', // your image path
                    width: mascotSize * 2, // Use a calculated size
                    height: mascotSize * 2,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.pets,
                        size: 80,
                        color: AppColors.deepIndigo,
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  // Preview Clip Container (Content restored and aligned)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 8.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColors.creamyOffWhite.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(children: [SizedBox(width: 8)]),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            // Custom shape for the curved bottom of the header
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(headerBottomRadius),
                bottomRight: Radius.circular(headerBottomRadius),
              ),
            ),
          ),

          // --- 2. Main Scrolling Content (SliverList) ---
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- NEW: Overlay Control Buttons ---
                    const SizedBox(height: 10),
                    const Text(
                      "Developer Controls:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.softCharcoal,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // 1. Request Permission Button
                          OutlinedButton(
                            onPressed: () {
                              // requestOverlayPermission();
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: AppColors.deepIndigo,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'Request Perm.',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.deepIndigo,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),

                          // 2. Start Bubble Button
                          ElevatedButton(
                            onPressed: _startBubble,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightNeonGreen,
                              foregroundColor: AppColors.deepIndigo,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'Start Bubble',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 8),

                          // 3. End Bubble Button
                          ElevatedButton(
                            onPressed: _startBubble,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.deepIndigo,
                              foregroundColor: AppColors.creamyOffWhite,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'End Bubble',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          // Extra space if needed
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // --- END NEW BUTTONS ---

                    // Search Bar is placed here to sit right under the collapsed header
                    const LighterSearchBar(),
                    const SizedBox(height: 30),

                    // Quick Access Folders Header
                    const Text(
                      "Quick Access",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepIndigo,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Folders Carousel
                    const FolderCarousel(),
                    const SizedBox(height: 30),

                    // Recent Clips Header
                    const Text(
                      "Recent Clips",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepIndigo,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // List of Recent Clips (Example 1)
                    const RecentClipCard(
                      sourceIcon: Icons.camera_alt_outlined,
                      sourceName: "Instagram",
                      clipText: "The best pizza in NY is at Lucali...",
                      folderTag: "Food",
                    ),
                    const SizedBox(height: 10),

                    // List of Recent Clips (Example 2)
                    const RecentClipCard(
                      sourceIcon: Icons.code,
                      sourceName: "VS Code",
                      clipText:
                          "Future.delayed is useful for simple animations.",
                      folderTag: "Dev",
                    ),
                    const SizedBox(height: 20),

                    // Example of the Empty/Action state card (as seen in the image)
                    Center(
                      child: TextButton(
                        onPressed: () => _navigateToIntroPage(context),
                        child: const Text(
                          "Back to Home",
                          style: TextStyle(
                            color: AppColors.deepIndigo,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
