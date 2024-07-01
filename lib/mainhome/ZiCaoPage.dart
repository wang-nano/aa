import 'package:flutter/material.dart';

class ZiCaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('紫草'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '药材简介',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '紫草，又名紫草根，是紫草科多年生草本植物紫草（Lithospermum erythrorhizon, Sieb.et Zucc.）的根。主产于辽宁、湖南、湖北、新疆等地。春、秋两季采挖，除去茎叶，晒干，润透切片用。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '美容功效',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '凉血活血，解毒祛斑。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '美容方法',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. 用于皮肤发斑、瘙痒，可煎服或外用水煎洗。',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. 用于痈疽疮疡、水火烫伤，可外用油浸剂。',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. 用于面斑，可配伍活血祛风药水煎洗。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '用法用量',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '煎服，3～10g。外用适量，水煎外洗或油浸外用。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '使用注意',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '本品性寒而滑，有轻泻作用，脾虚便溏者忌服。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '按语',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '紫草为凉血活血、解毒消斑之药，常用于治疗各种损容性疾病。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '配方',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. 痘疮方：紫草煎油涂之。',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2. 紫草润肌膏：紫草、当归、麻油。',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '3. 紫草地榆油：紫草、地榆、植物油。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '本草文献',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '1.《名医别录》：“通水道，疗肿胀满痛。”',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '2.《本草纲目》：“治斑疹，痘毒，活血凉血，利大肠。”',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '现代研究',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '紫草含有多种有效成分，具有抗菌、消炎、促进伤口愈合等作用。可用于各种皮肤病的治疗。',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
