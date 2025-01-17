import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  double _currentSliderValue = 0.0;
  final Duration _totalDuration = Duration(minutes: 3, seconds: 30);
  bool _isPlaying = true;

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    // Implement play/pause functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Handle close button press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/guruji.png'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.black,
                        inactiveTrackColor: Colors.black,
                        thumbColor: Colors.black,
                        overlayColor: Colors.black,
                        trackHeight: 4.0,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 16.0),
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        min: 0.0,
                        max: _totalDuration.inSeconds.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                          // Handle slider change
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(
                              Duration(seconds: _currentSliderValue.toInt())),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          _formatDuration(_totalDuration),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: _togglePlayPause,
                        child: Container(
                          margin: EdgeInsets.only(top: 8.0),
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Gauranga das on Overthinking\nin Relationships',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "4K+ Watching",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
