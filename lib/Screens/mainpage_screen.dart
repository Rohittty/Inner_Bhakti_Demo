import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/explore_screen.dart';
import 'package:inner_bhakti_demo/Screens/home_screen.dart';

import 'guide_home_page.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

class MainPage extends StatelessWidget {
  final BottomNavController _controller = Get.put(BottomNavController());

  final List<Widget> _pages = [
    HomeScreen(),
    GuideScreen(),
    ExploreScreen(),
    MeScreen(),
  ];

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/circle.png', // Replace with your circle icon path
              height: 30,
              width: 30,
            ),
            SizedBox(width: 8),
            Text(
              'InnerBhakti',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(
        () => IndexedStack(
          index: _controller.currentIndex.value,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _controller.currentIndex.value,
          onTap: (index) => _controller.changeIndex(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Guide',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Me',
            ),
          ],
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          selectedFontSize: 12, // Consistent font size
          unselectedFontSize: 12, // Consistent font size
          iconSize: 24, // Consistent icon size
          type: BottomNavigationBarType.fixed, // No shifting behavior
        ),
      ),
    );
  }
}

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Me Screen"));
  }
}
