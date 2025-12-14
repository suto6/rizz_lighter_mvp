import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OverlayApp extends StatelessWidget {
  const OverlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        color: Colors.transparent,
        child: Center(
          child: GestureDetector(
            onTap: () {
              FlutterOverlayWindow.shareData("highlight");
            },
            child: ClipOval(
              child: Image.asset(
                "assets/images/octyBubble.png",
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class PulseBubble extends StatefulWidget {
//   const PulseBubble({super.key});

//   @override
//   State<PulseBubble> createState() => _PulseBubbleState();
// }

// class _PulseBubbleState extends State<PulseBubble>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: Tween(begin: 1.0, end: 1.08)
//           .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
//       child: bubble(),
//     );
//   }

//   Widget bubble() {
//     return Container(
//       width: 60,
//       height: 60,
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.amber,
//       ),
//       child: const Icon(Icons.highlight),
//     );
//   }
// }
