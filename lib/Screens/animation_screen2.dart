import 'package:flutter/material.dart';
import 'package:inner_bhakti_demo/Screens/new_screen.dart'; // Import your NewScreen

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Listen for animation completion
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the next screen when the zoom-out is complete
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NewScreen()),
        );
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.5),
            radius: 0.9,
            colors: [
              Colors.orange.shade100,
              Colors.white,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/Burst.png"), // Your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: screenHeight * 0.2, // Position based on screen height
              left: screenWidth *
                  0.3, // Centered horizontally based on screen width
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  height: screenHeight *
                      0.7, // Adjusted height based on screen size
                  width:
                      screenWidth * 0.5, // Adjusted width based on screen size
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom:
                  screenHeight * 0.1, // Adjusted bottom position for the image
              left: screenWidth * 0.05, // Adjusted left position for the image
              child: Image.asset("assets/om.png"),
            ),
          ],
        ),
      ),
    );
  }
}

// Define NewScreen if not already defined
