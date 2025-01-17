import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/audio_display_screen.dart';

class ExploreScreen extends StatelessWidget {
  final List<Map<String, String>> plans = [
    {
      "title": "Anxiety",
      "days": "21 Days Plan",
      "image": "assets/gridimages/Anxiety.png"
    },
    {
      "title": "Work Stress",
      "days": "24 Days Plan",
      "image": "assets/gridimages/workStress.png"
    },
    {
      "title": "Depression",
      "days": "11 Days Plan",
      "image": "assets/gridimages/Depression.png"
    },
    {
      "title": "Deep Love",
      "days": "22 Days Plan",
      "image": "assets/gridimages/DeepLove.png"
    },
    {
      "title": "Sleep",
      "days": "21 Days Plan",
      "image": "assets/gridimages/Sleep.png"
    },
    {
      "title": "Anger & Fear",
      "days": "11 Days Plan",
      "image": "assets/gridimages/Anger.png"
    },
    {
      "title": "Hope & Faith",
      "days": "11 Days Plan",
      "image": "assets/gridimages/hope.png"
    },
    {
      "title": "Confidence",
      "days": "22 Days Plan",
      "image": "assets/gridimages/confidence.png"
    },
  ];

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.04,
        vertical: deviceHeight * 0.02,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: deviceWidth * 0.04,
          mainAxisSpacing: deviceHeight * 0.02,
          childAspectRatio: 1,
        ),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => PlaylistScreen(
                    title: plan["title"]!,
                    image: plan["image"]!,
                  ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(deviceWidth * 0.03),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    plan["image"]!,
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //   bottom: deviceHeight * 0.02,
                  //   left: deviceWidth * 0.03,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         plan["title"]!,
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: deviceWidth * 0.04,
                  //         ),
                  //       ),
                  //       SizedBox(height: deviceHeight * 0.005),
                  //       Text(
                  //         plan["days"]!,
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: deviceWidth * 0.03,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Positioned(
                  //   top: deviceHeight * 0.01,
                  //   right: deviceWidth * 0.03,
                  //   child: Icon(
                  //     Icons.lock,
                  //     color: Colors.white,
                  //     size: deviceWidth * 0.06,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  final String title;
  final String image;

  PlaylistScreen({super.key, required this.title, required this.image});

  final List<Map<String, String>> songs = [
    {"title": "Raam Naam Jaap", "duration": "2min | Day 1"},
    {"title": "Mahamrityunjaya", "duration": "3min | Day 2"},
    {"title": "Om Namah Sivaya", "duration": "5min | Day 3"},
    {"title": "Gayatri mantra", "duration": "4min | Day 4"},
    {"title": "Om Mani Padme Hum", "duration": "9min | Day 5"},
    {"title": "Hare Krishna", "duration": "1:30m | Day 6"},
    {"title": "Om Namo Narayanaya", "duration": "1:30m | Day 7"},
    {"title": "Raam Naam Jaap", "duration": "1:30m | Day 8"},
    {"title": "Mahamrityunjaya", "duration": "1:30m | Day 9"},
    {"title": "Om Namah Sivaya", "duration": "1:30m | Day 10"},
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "$title Prarthana Plan",
          style: TextStyle(color: Colors.black, fontSize: deviceWidth * 0.05),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: deviceHeight * 0.20,
              width: deviceWidth * 0.6,
              // child: Image.asset(
              //   image,
              //   height: deviceHeight * 0.20,
              //   width: deviceWidth,
              //   fit: BoxFit.cover,
              // ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(image),
              )),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  leading: Icon(
                    Icons.play_circle_fill,
                    color: Colors.orange,
                    size: deviceWidth * 0.08,
                  ),
                  title: Text(
                    song["title"]!,
                    style: TextStyle(fontSize: deviceWidth * 0.045),
                  ),
                  subtitle: Text(
                    song["duration"]!,
                    style: TextStyle(fontSize: deviceWidth * 0.035),
                  ),
                  onTap: () {
                    Get.to(AudioDisplay());
                    Get.snackbar(
                      "Playing",
                      song["title"]!,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.04),
                child: Divider(
                  color: Colors.grey[300], // Light gray color
                  thickness: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
