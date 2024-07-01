import 'package:flutter/material.dart';

class PrescriptionDetailPage extends StatelessWidget {
  final String prescriptionName;
  final String prescriptionSource;
  final String prescriptionDescription;
  final String prescriptionComposition;
  final String usageInstructions;

  const PrescriptionDetailPage({
    Key? key,
    required this.prescriptionName,
    required this.prescriptionSource,
    required this.prescriptionDescription,
    required this.prescriptionComposition,
    required this.usageInstructions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('处方详情 - $prescriptionName'),
        backgroundColor: Colors.purple[50],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              '处方名称：\n$prescriptionName',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '处方来源：\n$prescriptionSource',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '处方描述：\n$prescriptionDescription',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '处方成分：\n$prescriptionComposition',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '使用说明：\n$usageInstructions',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
