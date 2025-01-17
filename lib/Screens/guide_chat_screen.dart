import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inner_bhakti_demo/Screens/video.dart';

class GuideChatScreen extends StatefulWidget {
  @override
  _GuideChatScreenState createState() => _GuideChatScreenState();
}

class _GuideChatScreenState extends State<GuideChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"type": "user", "message": "Ram Ram Acharyaji"},
    {"type": "guide", "message": "Ram Ram. How are you feeling today?"},
    {
      "type": "user",
      "message": "I had a fight with my partner today. I am very anxious."
    },
    {
      "type": "guide",
      "message":
          "Alright! Let's do a 2 min dhyan on Sri Ram first to calm ourselves. And then we will talk about what happened today."
    },
    {
      "type": "guide",
      "message": "Ram Naam Jaap",
      "isRamNaamJaap": true,
    },
  ];

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({"type": "user", "message": _controller.text.trim()});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Your Guide',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Chat transfer message
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Your chat is transferring to Shastri Premanand Maharaj ji',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),

          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(width * 0.06),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                bool isUser = message['type'] == "user";
                bool isRamNaamJaap = message['isRamNaamJaap'] ?? false;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isUser)
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/Aacharya.png'), // Guide's image
                        radius: 16,
                      ),
                    if (!isUser) SizedBox(width: 8),
                    Flexible(
                      child: isRamNaamJaap
                          ? RamNaamJaapBubble(
                              onTap: () => Get.to(() => Video()),
                              width: width,
                            )
                          : ChatBubble(
                              text: message['message']!,
                              isUser: isUser,
                            ),
                    ),
                    if (isUser) SizedBox(width: width * 0.05),
                    if (isUser)
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/circle.png'), // User's image
                        radius: 16,
                      ),
                  ],
                );
              },
            ),
          ),

          // Message input
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: width * 0.04),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Write your message",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.attachment, color: Colors.orange),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
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

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isUser ? Colors.black : Colors.orange[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isUser ? Colors.white : Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}

class RamNaamJaapBubble extends StatelessWidget {
  final VoidCallback onTap;
  final double width;

  const RamNaamJaapBubble({
    Key? key,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: width * 0.55,
        width: width * 0.80,
        margin: EdgeInsets.symmetric(vertical: width * 0.03),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(width * 0.05)),
          image: DecorationImage(
            image: AssetImage(
              'assets/rectangle.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                height: 50,
                width: 300,
                child: Text(
                  "Ram Naam Jaap",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: width * 0.03,
              right: width * 0.04,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: width * 0.2,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: width * 0.12, // Larger size for the play button
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JaapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ram Naam Jaap Screen"),
      ),
    );
  }
}
