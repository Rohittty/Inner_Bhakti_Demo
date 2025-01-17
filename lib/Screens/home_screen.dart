import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/global.dart';
import 'package:inner_bhakti_demo/Screens/journey_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedEmoji = -1; // Track selected emoji

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            Text(
              'Welcome Back, ${name.value}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: height * 0.02),
            // Goal Container
            Container(
              padding: EdgeInsets.all(width * 0.05),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4E5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.emoji_emotions,
                          color: const Color(0xFFFFA726)),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: Text(
                          'Achieve a stress-free day at work',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    '1 out of 5 prayers completed',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.005),
                          height: height * 0.01,
                          decoration: BoxDecoration(
                            color: index == 0
                                ? const Color(0xFFFFA726)
                                : const Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  // Button with Rounded Borders
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA726),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    ),
                    onPressed: () {
                      Get.to(JourneyScreen());
                    },
                    child: Center(
                      child: Text(
                        "Continue today's journey",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Text(
              'How are you feeling today, ${name.value}?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: height * 0.02),
            // Emoji Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  ['Very Sad', 'Neutral', 'Happy', 'Very Happy', 'Awesome']
                      .asMap()
                      .entries
                      .map(
                        (entry) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedEmoji = entry.key;
                            });
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: width * 0.08,
                                backgroundColor: const Color(0xFFFFF4E5),
                                child: Icon(
                                  Icons.emoji_emotions,
                                  color: selectedEmoji == entry.key
                                      ? const Color(0xFFFFA726)
                                      : const Color(0xFFBDBDBD),
                                  size: width * 0.06,
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                entry.value,
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: height * 0.03),
            // Daily Streak Section
            Text(
              'Your Daily Streak',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              'Consistency is the key to constant improvement',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: height * 0.02),
            // Daily Streak Checkboxes with Day Labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) => Column(
                  children: [
                    Container(
                      width: width * 0.12,
                      height: width * 0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: index < 3
                              ? const Color(0xFFFFA726)
                              : const Color(0xFFEEEEEE),
                          width: 2,
                        ),
                        color:
                            index < 3 ? const Color(0xFFFFA726) : Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          index < 3 ? Icons.check : Icons.circle,
                          color: index < 3
                              ? Colors.white
                              : const Color(0xFFBDBDBD),
                          size: width * 0.05,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      ['M', 'T', 'W', 'T', 'F', 'S', 'S'][index],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            // Journal Entry Section
            Container(
              padding: EdgeInsets.all(width * 0.05),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.mood_bad,
                          color: Colors.black, size: width * 0.08),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: Text(
                          'Feeling Sad because of Work Stress',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    'Add a note',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFA726),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA726),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'View full journal',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.001),
            // Background Image with Text
            Container(
              width: double.infinity,
              height: 200,
              // color: const Color.fromARGB(255, 207, 178, 188),
              child: Stack(
                children: [
                  Positioned(
                    top: -100,
                    right: -40,
                    child: Image.asset(
                      'assets/Lingkaran.png',
                      height: height * 0.6,
                      width: width * 0.8,
                    ),
                  ),
                  Positioned(
                    top: height * 0.03,
                    child: Text(
                      'Daily consistency is the key to\npositive life transformations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
