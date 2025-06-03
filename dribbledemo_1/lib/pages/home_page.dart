import 'package:dribbledemo_1/components/emotion_face.dart';
import 'package:flutter/material.dart';
import 'package:dribbledemo_1/components/list_Item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[600],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // Greeting and Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi,Steve!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '30 may, 2025',
                            style: TextStyle(color: Colors.blue[200]),
                          ),
                        ],
                      ),

                      // Notification
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  // search bar
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.blue[800]),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // How do you feel?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),
                  // Emotion Cards
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // angry
                      EmotionCard(emotion: '😡', emotionDes: 'angry'),
                      // sad
                      EmotionCard(emotion: '😢', emotionDes: 'sad'),
                      // well
                      EmotionCard(emotion: '😅', emotionDes: 'well'),
                      // happy
                      EmotionCard(emotion: '😊', emotionDes: 'happy'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            DraggableScrollableSheet(
              initialChildSize: 0.55, // 初始高度（百分比）
              minChildSize: 0.55, // 最小高度
              maxChildSize: 0.90, // 最大高度
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      const SizedBox(height: 12),
                      Center(
                        child: Container(
                          width: 40,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exercise',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                            ),
                            Icon(Icons.more_horiz, color: Colors.blue[600]),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListItem(
                                title: 'Running',
                                subtitle: '30 minutes',
                                icon: Icons.directions_run,
                              ),
                              ListItem(
                                title: 'Cycling',
                                subtitle: '45 minutes',
                                icon: Icons.directions_bike,
                              ),
                              ListItem(
                                title: 'Swimming',
                                subtitle: '1 hour',
                                icon: Icons.pool,
                              ),
                              ListItem(
                                title: 'Yoga',
                                subtitle: '30 minutes',
                                icon: Icons.self_improvement,
                              ),
                              ListItem(
                                title: 'Weightlifting',
                                subtitle: '1 hour',
                                icon: Icons.fitness_center,
                              ),
                              ListItem(
                                title: 'Weightlifting',
                                subtitle: '1 hour',
                                icon: Icons.fitness_center,
                              ),
                              ListItem(
                                title: 'Weightlifting',
                                subtitle: '1 hour',
                                icon: Icons.fitness_center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
