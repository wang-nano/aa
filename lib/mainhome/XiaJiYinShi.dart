import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XiaJiYinShi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('夏季的饮食与滋补原则'),
        backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '一、少吃肥甘油腻\n\n'
                  '炎热的夏季，本身食欲也降低不少，这时候的饮食原则要讲究清淡，少油、少盐、少糖以及少刺激性食物。夏季温度很高，很容易出汗，身体也很容易出现缺水的情况，如果饮食盐分过多的话，轻度的会脱水，血压处于异常状态，严重的话则会影响到心血管健康。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Image.asset('asset/images/1.png'),
            Text(
              '二、多吃杀菌蔬菜\n\n'
                  '夏季是肠胃疾病高发的季节，多吃一些杀菌蔬菜，可以预防疾病。例如洋葱、大蒜、大葱等。这些葱蒜类蔬菜中，含有丰富的植物广谱杀菌素，对各种球菌、杆菌、真菌、病毒有杀灭和抑制作用。其中，作用最突出的是大蒜，最好生食。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Image.asset('asset/images/2.png'),
            Text(
              '三、多食清热利湿食物\n\n'
                  '夏季阳气处于旺盛的阶段，不仅是湿气比较重，病毒和细菌更容易滋生。可以多吃一些可以清热和利湿的食物，例如红豆粥、荷叶粥、绿豆粥等，或者是用莲叶、冬瓜、薏米等一起煮汤喝。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Image.asset('asset/images/3.png'),
            Text(
              '四、适量增加碱性食物\n\n'
                  '炎热的夏天，很容易流汗，身体的盐以及钾离子也会流失，身体就会出现酸多碱少的情况。可以适当的多吃一些碱性食物维持体内ph值，如冬瓜、黄瓜、丝瓜、苦瓜，除了对身体酸碱平衡有利之外，还具有降血压、保护血管的作用。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '五、喝热茶\n\n'
                  '喝热茶让自己排汗的同时，也能让汗水蒸发掉，而且喝热茶，还能守好肠胃跟阳气，防止湿邪入体。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '六、适量饮水，科学补水防中暑\n\n'
                  '夏季出汗多，身体容易缺水，因此要注意适量饮水，科学补水。除了日常饮水，还可以选用富含电解质的饮料，如椰汁、鲜榨果汁等，有效补充水分和电解质的流失。此外，应避免饮用过于冰凉的饮料，以免对胃部产生刺激。',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
