import 'package:flutter/material.dart';

class HerbalDecoctionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('煎药的正确方法'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. 用水',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '选择水质清洁的水，如自来水、井水或泉水。可考虑先让自来水静置数小时以减少氯的含量。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '2. 加多少水',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '一般头煎水量以没过药面二横指或手掌约3厘米为宜。根据药材的吸水性、药性、剂量等因素酌情增减水量。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '3. 药物的煎煮顺序',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '根据方剂要求和药物的特性确定煎煮顺序，特殊药物可采取先煎的方法，清热解表药物宜后下。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '4. 火候及时间',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '先用武火煮沸后转文火保持煮沸状态，煎药时间根据药物属性而定，一般头煎约15~20分钟，二煎约10~15分钟。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '5. 药量及浓度',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '保持中药煎出量在400~500毫升之间，不宜过分浓缩药液，以免降低药效。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'PS: 药渣可以再用',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '将第三遍准备扔掉的药渣再加水煎10几分钟，用于泡下一服中药。',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
