import 'package:flutter/material.dart';

class EmotionCard extends StatelessWidget {
  final String emotion;
  final String emotionDes;

  const EmotionCard({
    super.key,
    required this.emotion,
    required this.emotionDes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text(emotion, style: TextStyle(fontSize: 25))),
        ),
        SizedBox(height: 8.0),
        Text(emotionDes, style: TextStyle(fontSize: 15, color: Colors.white)),
      ],
    );
  }
}
