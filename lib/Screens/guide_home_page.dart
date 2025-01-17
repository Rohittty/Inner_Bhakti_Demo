import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/guide_chat_screen.dart';

class GuideController extends GetxController {
  // List of images for the grid
  var guides = [
    'assets/guideimages/guide7.png',
    'assets/guideimages/guide3.png',
    'assets/guideimages/guide4.png',
    'assets/guideimages/guide3.png',
    'assets/guideimages/guide2.png',
    'assets/guideimages/guide1.png',
  ].obs;

  // List of objects for the horizontal scroll
  var spotlightGuides = [
    {
      'name': 'Prashant Tiwari',
      'subtitle': 'Guided 2.5k People',
      'image': 'assets/guideimages/guide1.png'
    },
    {
      'name': 'Ramakant Shastri',
      'subtitle': 'Guided 1.5k People',
      'image': 'assets/guideimages/guide2.png'
    },
    {
      'name': 'Om Saran Tripathi',
      'subtitle': 'Guided 2k People',
      'image': 'assets/guideimages/guide3.png'
    },
  ].obs;
}

class GuideScreen extends StatelessWidget {
  final GuideController guideController = Get.put(GuideController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenWidth * 0.06,
          ),
          // Title
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
            child: Text(
              'Spiritual Guides',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.02),

          // "Guides Under Spotlight" text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              'Guides Under Spotlight',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: screenWidth * 0.04,
          ),
          // Horizontal Scrolling Row
          SizedBox(
            height: screenWidth * 0.2,
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: guideController.spotlightGuides.length,
                itemBuilder: (context, index) {
                  var guide = guideController.spotlightGuides[index];
                  return SpotlightGuideCard(
                    name: guide['name']!,
                    subtitle: guide['subtitle']!,
                    image: guide['image']!,
                    screenWidth: screenWidth,
                  );
                },
              );
            }),
          ),

          // Grid view of guides
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: screenWidth * 0.04,
                    mainAxisSpacing: screenWidth * 0.04,
                  ),
                  itemCount: guideController.guides.length,
                  itemBuilder: (context, index) {
                    String imagePath = guideController.guides[index];
                    return GestureDetector(
                      onTap: () {
                        if (index == 2) {
                          // Navigate to a new screen when the third card is tapped
                          Get.to(GuideChatScreen());
                        }
                      },
                      child: GuideCard(
                        imagePath: imagePath,
                        screenWidth: screenWidth,
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class SpotlightGuideCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String image;
  final double screenWidth;

  SpotlightGuideCard({
    required this.name,
    required this.subtitle,
    required this.image,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.04),
      width: screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            child: Image.asset(
              image,
              width: screenWidth * 0.12,
              height: screenWidth * 0.12,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),

          // Guide Name and Subtitle
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final String imagePath;
  final double screenWidth;

  GuideCard({required this.imagePath, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
