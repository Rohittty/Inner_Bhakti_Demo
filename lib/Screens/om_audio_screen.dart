import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/gayntri_feeling_screen.dart';

class OmAudioScreen extends StatefulWidget {
  @override
  _OmAudioScreenState createState() => _OmAudioScreenState();
}

class _OmAudioScreenState extends State<OmAudioScreen> {
  bool isFavorite = false;
  double currentTime = 75.0; // Current playback time in seconds
  double totalTime = 150.0; // Total audio time in seconds

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/ombackground.png'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Get.to(
                              GayntriFeelingScreen()); // Navigate to other screen
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Gayatri Mantra",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "A most powerful mantra for daily recital, improves holistic wellbeing",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gayatri Mantra\n Mantras",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: Icon(
                              Icons.favorite,
                              color: isFavorite ? Colors.red : Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Positioned(
                      right: (MediaQuery.of(context).size.width * 0.9) *
                          (currentTime / totalTime),
                      child: Container(
                        height: 4,
                        width: (MediaQuery.of(context).size.width * 0.9) *
                            (currentTime / totalTime),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${formatTime(currentTime)}",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        "${formatTime(totalTime)}",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatTime(double timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = (timeInSeconds % 60).toInt();
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
