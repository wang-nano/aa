import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '搜索',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String _plantInfo = '';
  List<String> _plantList = [
    '艾叶',
    '巴戟天',
    '白花蛇舌草',
    '白茅根',
    '白芍',
    '白头翁',
    '百部',
    '百合',
    '半夏',
    '北沙参',
    '苍术',
    '侧柏叶',
    '柴胡',
    '赤芍',
    '穿心莲',
    '大青叶',
    '大血藤',
    '丹参',
    '党参',
    '地榆',
    '杜仲',
    '佛手',
    '附子',
    '葛根',
    '贯众',
    '厚朴',
    '虎杖',
    '槐花',
    '黄柏',
    '黄精',
    '黄芪',
    '金钱草',
    '金银花',
    '荆芥',
    '决明子',
    '苦参',
    '连翘',
    '络石藤',
    '麦冬',
    '墨旱莲',
    '牛滕',
    '佩兰',
    '蒲公英',
    '蒲黄',
    '前胡',
    '肉豆蔻',
    '肉桂',
    '射干',
    '首乌藤',
    '天冬',
    '通草',
    '五加皮',
    '细辛',
    '夏枯草',
    '仙鹤草',
    '香附',
    '小茴香',
    '野菊花',
    '益母草',
    '菌陈',
    '玉竹',
    '远志',
    '泽兰',
    '知母',
    '枳实',
    '紫花地丁',
    '紫菀',
  ];

  Future<void> _fetchPlantInfo(String plantName) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/plant/$plantName'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _plantInfo = data['info'];
      });
      _showPlantInfoDialog(_plantInfo);
    } else {
      setState(() {
        _plantInfo = 'Failed to fetch plant information';
      });
      _showPlantInfoDialog(_plantInfo);
    }
  }

  void _showPlantInfoDialog(String plantInfo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('详细信息'),
          content: Text(plantInfo),
          actions: <Widget>[
            TextButton(
              child: Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
        backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: '输入中草药名称',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search), // 使用搜索图标作为按钮样式
                  onPressed: () {
                    _fetchPlantInfo(_controller.text);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _plantList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_plantList[index]),
                    onTap: () {
                      _fetchPlantInfo(_plantList[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
