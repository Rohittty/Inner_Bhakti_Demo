import 'package:flutter/material.dart';
import 'package:inner_bhakti_demo/Screens/audio_play_screen.dart';
import 'package:inner_bhakti_demo/Screens/global.dart';

class MultiPageForm extends StatefulWidget {
  const MultiPageForm({super.key});

  @override
  _MultiPageFormState createState() => _MultiPageFormState();
}

class _MultiPageFormState extends State<MultiPageForm> {
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();
  int _currentPage = 0;
  String? _errorMessage;
  String _selectedGender = "";
  String _selectedMood = "";
  String _selectedReason = "";
  final int totalPages = 5;

  bool get _isOptionSelected {
    switch (_currentPage) {
      case 0:
        return _nameController.text.trim().isNotEmpty;
      case 1:
        return _selectedGender.isNotEmpty;
      case 2:
        return _selectedMood.isNotEmpty;
      case 3:
        return _selectedReason.isNotEmpty;
      default:
        return true;
    }
  }

  void _nextPage() {
    if (!_isOptionSelected) {
      setState(() {
        _errorMessage = "Please complete this step.";
      });
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    if (_currentPage < totalPages - 1) {
      // Hide the keyboard before navigating to the next page
      FocusScope.of(context).unfocus();
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildNamePage() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: screenHeight * 0.06),
          Text(
            "Hello!\nWhat should we call you?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          TextField(
            controller: _nameController,
            onChanged: (value) => setState(() {
              name.value = _nameController.text;
            }),
            decoration: InputDecoration(
              hintText: "Enter your name",
              filled: true,
              fillColor: const Color(0xFFECECEC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
              errorText: _currentPage == 0 ? _errorMessage : null,
            ),
            style: TextStyle(fontSize: screenWidth * 0.04),
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }

  Widget _buildGenderPage() {
    return _buildOptionPage(
      title:
          "Nice to meet, ${_nameController.text.trim()}!\nWhat is your gender?",
      options: ["Male", "Female", "Other", "Prefer not to say"],
      selectedOption: _selectedGender,
      onOptionSelected: (value) => setState(() => _selectedGender = value),
    );
  }

  Widget _buildMoodPage() {
    return _buildOptionPage(
      title: "How have you been feeling lately?",
      options: ["Terrible", "Bad", "Neutral", "Good"],
      selectedOption: _selectedMood,
      onOptionSelected: (value) => setState(() => _selectedMood = value),
    );
  }

  Widget _buildReasonPage() {
    return _buildOptionPage(
      title: "Sorry to hear that. What is the reason for this?",
      options: ["Work Stress", "Bad Relationships", "Loneliness", "Bad Health"],
      selectedOption: _selectedReason,
      onOptionSelected: (value) => setState(() => _selectedReason = value),
    );
  }

  Widget _buildOptionPage({
    required String title,
    required List<String> options,
    required String selectedOption,
    required ValueChanged<String> onOptionSelected,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.06),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            ...options.map(
              (option) => GestureDetector(
                onTap: () => onOptionSelected(option),
                child: Container(
                  margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    color: selectedOption == option
                        ? Colors.white
                        : const Color(0xFFECECEC),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selectedOption == option
                          ? Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      if (selectedOption == option)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.black,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFifthPage() {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.08),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6F00),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Image.asset(
                'assets/ramji.png',
                height: 350,
              ),
            ),
            SizedBox(height: screenHeight * 0.08),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AudioPlayScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F2),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss keyboard on outside tap
        },
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Stack(
                  children: [
                    Container(
                      height: 4,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    AnimatedContainer(
                      height: 4,
                      width: screenWidth * ((_currentPage + 1) / totalPages),
                      color: Colors.black,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildNamePage(),
                    _buildGenderPage(),
                    _buildMoodPage(),
                    _buildReasonPage(),
                    _buildFifthPage(),
                  ],
                ),
              ),
              if (_currentPage != totalPages - 1)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.10),
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor:
                          _isOptionSelected ? Colors.orange : Colors.grey,
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
