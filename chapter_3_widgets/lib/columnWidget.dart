import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Widget 示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // 设置主轴（垂直）对齐方式
          mainAxisAlignment: MainAxisAlignment.start,
          // 设置交叉轴（水平）对齐方式
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              height: 170,
              width: double.infinity,
              child: const Center(
                  child: Text('WIDGET', style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.green,
              height: 170,
              width: double.infinity,
              child: const Center(
                  child: Text('WIDGET', style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.orange,
              height: 170,
              width: double.infinity,
              child: const Center(
                  child: Text('WIDGET', style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.blue,
              height: 170,
              width: double.infinity,
              child: const Center(
                  child: Text('WIDGET', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
