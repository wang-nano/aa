import 'package:flutter/material.dart';
import 'package:untitled/mainhome/XiaJiYinShi.dart';
import '../mainhome/HarvestingGuidelinesPage.dart';
import '../mainhome/HerbalDecoctionPage.dart';
import '../mainhome/Yaoshanshipu.dart';
import '../mainhome/ZhongYaoBingLi.dart';
import '../mainhome/ZhongYiYangShengPage.dart';
import '../mainhome/ZiCaoPage.dart';
import '../mainhome/meiriyifang.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildGridItem(String imagePath, String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomItem(String imagePath, String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 400,
        height: 250,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.black54,
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16.0),
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '首页',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          SliverGrid.count(
            crossAxisCount: 4, // Adjust the number of columns for a better layout
            children: [
              _buildGridItem('asset/images/zhongyibingli.jpg', '中医病理', ZhongYaoBingLi()),
              _buildGridItem('asset/images/zhongyaofang.jpg', '每日一方', meiriyifang()),
              _buildGridItem('asset/images/yangsheng.jpg', '养生保健', ZhongYiYangShengPage()),
              _buildGridItem('asset/images/yaoshan.jpg', '药膳食谱', YaoShanShiPuPage()),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildCustomItem('asset/images/xiajiyinshi.png', '夏季的饮食与滋补原则', XiaJiYinShi()),
                _buildCustomItem('asset/images/zhongyaocaishou.png', '如何掌握中药材的采收时间', HarvestingGuidelinesPage()),
                _buildCustomItem('asset/images/zhongyaojianfu.png', '中药煎服的方法 自己煎药的注意', HerbalDecoctionPage()),
                _buildCustomItem('asset/images/zicao.png', '紫草的美容功效及方法', ZiCaoPage()),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                  onTap: () {
                    // Add navigation logic here if needed
                  },
                );
              },
              childCount: 0, // Adjust the childCount as needed
            ),
          ),
        ],
      ),
    );
  }
}
