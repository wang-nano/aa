import 'package:flutter/material.dart';
import 'travel_page.dart';

class RecognitionRecordPage extends StatelessWidget {
  final List<RecognitionRecord> records;

  const RecognitionRecordPage({required this.records});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('识别记录'),
        backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
      ),
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          var record = records[index];
          return GestureDetector(
            onTap: () {
              _navigateToDetailsPage(context, record);
            },
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SizedBox(
                width: 56,
                height: 56,
                child: Image.file(record.imageFile, fit: BoxFit.cover),
              ),
              title: Text(record.plantName),
              subtitle: Text(record.className),
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetailsPage(BuildContext context, RecognitionRecord record) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(record: record)),
    );
  }
}
