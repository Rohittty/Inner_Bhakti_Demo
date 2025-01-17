import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for FilteringTextInputFormatter
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/home_screen.dart';
import 'package:inner_bhakti_demo/Screens/mainpage_screen.dart';

class VerificationController extends GetxController {
  var phoneController = TextEditingController();
  var otpController = TextEditingController();

  var countryCode = "+1".obs; // Reactive country code
  var isPhoneValid = false.obs;
  var isOtpValid = false.obs;

  void validatePhone(String value) {
    isPhoneValid.value = value.length == 10; // Example phone validation
  }

  void validateOtp(String value) {
    isOtpValid.value = value.length == 6; // OTP must be exactly 6 digits
  }
}

class VerificationScreen extends StatelessWidget {
  final VerificationController controller = Get.put(VerificationController());
  final PageController pageController = PageController();

  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () =>
          FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildFirstPage(screenWidth, screenHeight, pageController, context),
            buildSecondPage(screenWidth, screenHeight, pageController, context),
          ],
        ),
        bottomSheet:
            buildContinueButton(screenWidth, screenHeight, pageController),
      ),
    );
  }

  Widget buildFirstPage(double screenWidth, double screenHeight,
      PageController pageController, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.05),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
              minHeight: 8,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Text(
            "What's your Mobile",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "We will send authentication\ncode to verify your mobile",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            children: [
              Obx(() => DropdownButton<String>(
                    value: controller.countryCode.value,
                    items: const [
                      DropdownMenuItem(value: "+1", child: Text("+1")),
                      DropdownMenuItem(value: "+91", child: Text("+91")),
                      DropdownMenuItem(value: "+44", child: Text("+44")),
                    ],
                    onChanged: (value) => controller.countryCode.value = value!,
                  )),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  maxLength: 10,
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "Enter your mobile",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    controller.validatePhone(value);
                    if (value.length == 10) {
                      FocusScope.of(context).unfocus(); // Dismiss keyboard
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }

  Widget buildSecondPage(double screenWidth, double screenHeight,
      PageController pageController, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.05),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 1.0,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
              minHeight: 8,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Text(
            "Verify your Mobile",
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "We’ve sent a 6 digit OTP on your mobile number",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: screenHeight * 0.04),
          TextField(
            controller: controller.otpController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],
            decoration: InputDecoration(
              hintText: "000 000",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              letterSpacing: 16,
            ),
            onChanged: (value) {
              controller.validateOtp(value);
              if (value.length == 6) {
                FocusScope.of(context).unfocus(); // Dismiss keyboard
              }
            },
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }

  Widget buildContinueButton(
      double screenWidth, double screenHeight, PageController pageController) {
    return Obx(() {
      int currentPage =
          pageController.hasClients ? pageController.page?.round() ?? 0 : 0;
      bool isButtonEnabled = currentPage == 0
          ? controller.isPhoneValid.value
          : controller.isOtpValid.value;

      return Container(
        height: screenHeight * 0.08,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: isButtonEnabled
              ? () {
                  if (currentPage == 0) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else if (currentPage == 1) {
                    // Ensure navigation works
                    Get.offAll(() => MainPage());
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isButtonEnabled ? Colors.orange : Colors.grey,
            minimumSize: Size(screenWidth * 0.7, screenHeight * 0.06),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      );
    });
  }
}
