import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> content;

  const DetailPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(content['title']!),
        backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                content['img_src']!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 8),
              Text('${content['content']}'),
            ],
          ),
        ),
      ),
    );
  }
}
