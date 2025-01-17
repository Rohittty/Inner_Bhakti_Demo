import 'package:flutter/material.dart';
import 'package:inner_bhakti_demo/Screens/om_song_screen.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Task completion status
    final List<Map<String, dynamic>> prayers = [
      {
        "title": "Ram Naam Jaap",
        "subtitle": "Completed 5 mins ago",
        "completed": true
      },
      {"title": "Gayatri Mantra", "subtitle": "01:25 min", "completed": false},
      {
        "title": "Mahamitryunjaya",
        "subtitle": "After lunch",
        "completed": false
      },
      {
        "title": "Om Namah Sivaya",
        "subtitle": "Later in the evening",
        "completed": false
      },
      {
        "title": "Om Namo Narayanaya",
        "subtitle": "Before you go to sleep",
        "completed": false
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button manually added at the top
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // Handle back navigation
                },
              ),
              SizedBox(
                  height: height * 0.01), // Add space below the back button
              Text(
                "Journey for Today",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Achieve a stress free day",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: Column(
                  children: List.generate(prayers.length, (index) {
                    bool isTapable = !prayers[index]["completed"] &&
                        (index == 0 || prayers[index - 1]["completed"]);
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            if (prayers[index]["title"] == "Gayatri Mantra")
                              Positioned(
                                bottom: -height * 0.02,
                                right: -width * 0.07,
                                child: Opacity(
                                  opacity: 0.3,
                                  child: Image.asset(
                                    'assets/Lingkaran.png',
                                    width: width * 0.6,
                                    height: width * 0.6,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            _buildPrayerItem(
                              width,
                              height,
                              prayers[index]["title"],
                              prayers[index]["subtitle"],
                              prayers[index]["completed"],
                              isTapable,
                              onTap: prayers[index]["title"] == "Gayatri Mantra"
                                  ? () {
                                      // Navigate to a new page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const JaapScreen()),
                                      );
                                    }
                                  : null,
                            ),
                          ],
                        ),
                        if (index < prayers.length - 1)
                          _buildConnector(
                              width, height, prayers[index]["completed"]),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerItem(double width, double height, String title,
      String subtitle, bool completed, bool isTapable,
      {VoidCallback? onTap}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: width * 0.08,
              backgroundColor: completed
                  ? Colors.green
                  : (isTapable ? Colors.orange : Colors.grey),
            ),
            GestureDetector(
              onTap: isTapable ? onTap : null,
              child: Icon(
                completed ? Icons.check : Icons.play_arrow,
                color: Colors.white,
                size: width * 0.08,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.01),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.005),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildConnector(double width, double height, bool active) {
    return SizedBox(
      height: height * 0.08,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Expanded(
            child: Container(
              width: 2,
              color: active ? Colors.orange : Colors.grey,
              margin: const EdgeInsets.symmetric(vertical: 2),
            ),
          ),
        ),
      ),
    );
  }
}
