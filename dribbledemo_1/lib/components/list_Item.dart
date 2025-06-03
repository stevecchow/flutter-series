import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin 左右各20像素，下 20，上0像素
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.orange[600],
            child: Icon(icon, color: Colors.white),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.blue[600]),
      ),
    );
  }
}
