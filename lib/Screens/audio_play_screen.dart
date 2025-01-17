import 'package:flutter/material.dart';
import 'package:inner_bhakti_demo/Screens/feeling_dialog_screen.dart';

class AudioPlayScreen extends StatefulWidget {
  const AudioPlayScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AudioPlayScreenState createState() => _AudioPlayScreenState();
}

class _AudioPlayScreenState extends State<AudioPlayScreen> {
  bool isHeartSelected = false;

  @override
  Widget build(BuildContext context) {
    // Getting screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/rammaa.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // AppBar with Back and Close buttons
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04, // Use dynamic width
                    vertical: screenHeight * 0.02, // Use dynamic height
                  ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeelingScreen(
                                isContinueButtonEnabled: true,
                              ), // Replace with your new screen
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
                // Audio player controls
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Stack(
                    clipBehavior: Clip.none, // Allow elements to overflow
                    children: [
                      Column(
                        children: [
                          // Title and subtitle above progress bar
                          Text(
                            "Raam Naam Jaap",
                            style: TextStyle(
                              fontSize: screenWidth * 0.05, // Adjust font size
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Shri Raam",
                            style: TextStyle(
                              fontSize: screenWidth * 0.04, // Adjust font size
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // Progress bar
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 14.0),
                              thumbColor: Colors.white,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white54,
                            ),
                            child: Slider(
                              value: 75.0, // Example value (adjust accordingly)
                              max: 150.0, // Example max value
                              onChanged: (value) {},
                            ),
                          ),
                          // Progress duration
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "01:15",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.white),
                              ),
                              Text(
                                "02:30",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.03,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                      // Heart and Share icons above the progress bar
                      Positioned(
                        right: screenWidth * 0.04, // Dynamic positioning
                        top: screenHeight * 0.05, // Dynamic positioning
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color:
                                    isHeartSelected ? Colors.red : Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  isHeartSelected = !isHeartSelected;
                                });
                              },
                            ),
                            SizedBox(
                                width: screenWidth * 0.02), // Dynamic spacing
                            IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Add your share functionality here
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MultiPageForm extends StatelessWidget {
  const MultiPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  minChildSize: 0.5,
                  maxChildSize: 1.0,
                  builder: (_, scrollController) => ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                    child: AudioPlayScreen(),
                  ),
                );
              },
            );
          },
          child: Text("Play"),
        ),
      ),
    );
  }
}
