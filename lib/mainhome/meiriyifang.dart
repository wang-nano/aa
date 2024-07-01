import 'package:flutter/material.dart';
import '../zhongyaofangji/PrescriptionDetailPage.dart';

// 方剂类
class Prescription {
  final String name;
  final String source;
  final String description;
  final String composition;
  final String instructions;

  Prescription({
    required this.name,
    required this.source,
    required this.description,
    required this.composition,
    required this.instructions,
  });
}

class meiriyifang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 选择要显示的方剂
    Prescription selectedPrescription = Prescription(
      name: '桃核承气汤',
      source: '《伤寒论》',
      description: '太阳病不解，热结膀胱，其人如狂，血自下，下者愈。其外不解者，尚未可攻，当先解其外；外解已，但少腹急结者，乃可攻之。',
      composition: '桃仁五十个（去皮尖），大黄四两，桂枝二两（去皮），甘草二两（炙）,芒硝二两。',
      instructions: '上五味，以水七升，煮取二升半，去滓，内芒硝，更上火，微沸下火，先食温服五合，日三服。',
    );

    return PrescriptionDetailPage(
      prescriptionName: selectedPrescription.name,
      prescriptionSource: selectedPrescription.source,
      prescriptionDescription: selectedPrescription.description,
      prescriptionComposition: selectedPrescription.composition,
      usageInstructions: selectedPrescription.instructions,
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('方剂详情'),
          backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
        ),
        body: meiriyifang(), // 不再需要传递方剂对象
      ),
    ),
  );
}
