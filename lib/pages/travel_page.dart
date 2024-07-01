import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'RecognitionRecordPage.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List<RecognitionRecord> _recognitionRecords = [];   //识别记录列表

  //从相机或相册获取图片
  Future<void> _getImage(bool isCamera) async {
    final imagePicker = ImagePicker();
    final pickedFile = isCamera
        ? await imagePicker.getImage(source: ImageSource.camera)
        : await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      await _uploadAndSaveImage(imageFile); //上传并保存图像并进行预测
    } else {
      print('No image selected.');
    }
  }

  //上传并保存图像
  Future<void> _uploadAndSaveImage(File imageFile) async {
    final uri = Uri.parse('http://127.0.0.1:8000/predict/'); //后端ip端点
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    final jsonResp = json.decode(respStr);

    if (response.statusCode == 200) {
      //解析预测结果并添加到识别记录中
      RecognitionRecord record = RecognitionRecord(
        imageFile: imageFile,
        className: jsonResp['class'],
        probability: jsonResp['probability'].toString(),
        plantName: jsonResp['plant_name'],
        plantInfo: jsonResp['plant_info'],
      );
      setState(() {
        _recognitionRecords.add(record);
      });
    } else {
      print('Failed to get prediction');
    }
  }

  //导航到详情页
  void _navigateToDetailsPage(RecognitionRecord record) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(record: record)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('植物/中草药识别'),
        backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 2, // Occupy two-thirds of the available vertical space
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _getImage(true),
                      icon: Icon(Icons.camera_alt, size: 60), // Add camera icon and increase size
                      label: Text('拍照', style: TextStyle(fontSize: 40)), // Add text and increase font size
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20), // Add padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // Set border radius
                        ),
                        minimumSize: Size(double.infinity, 0), // Set button width to fill the screen
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _getImage(false),
                      child: Text('选择照片', style: TextStyle(fontSize: 40)), // Increase font size
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20), // Add padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // Set border radius
                        ),
                        minimumSize: Size(double.infinity, 0), // Set button width to fill the screen
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecognitionRecordPage(records: _recognitionRecords)),
                        );
                      },
                      child: Text('识别记录', style: TextStyle(fontSize: 40)), // Increase font size
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20), // Add padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // Set border radius
                        ),
                        minimumSize: Size(double.infinity, 0), // Set button width to fill the screen
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//详情页面，显示识别结果的详细信息
class DetailsPage extends StatelessWidget {
  final RecognitionRecord record;

  const DetailsPage({required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('识别结果'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add padding to the sides
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.file(record.imageFile),
                    SizedBox(height: 20),
                    Text(
                      '植物名称: ${record.plantName}',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '置信度: ${record.probability}',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '类别: ${record.className}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '植物信息: \t${record.plantInfo}', // Use \t for two-character indentation
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 定义识别记录类，包含识别结果的相关信息
class RecognitionRecord {
  final File imageFile; // 图像文件
  final String className; // 类别名称
  final String probability; // 置信度
  final String plantName; // 植物名称
  final String plantInfo; // 植物信息

  RecognitionRecord({
    required this.imageFile,
    required this.className,
    required this.probability,
    required this.plantName,
    required this.plantInfo,
  });
}
