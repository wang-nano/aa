import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../mypage/login_page.dart';
import 'edit_page.dart';

// MyPage 中读取并显示用户名
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    getUsername();
    getPassword();
  }

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
    });
  }

  void getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      password = prefs.getString('password') ?? '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        backgroundColor: Colors.purple[50], // 设置背景颜色为浅紫色
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => LoginRegisterPage()),
              //   );
              // },
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      username, // 显示用户名
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '用户级别: 普通用户',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPage(username: username, password: '')),
                    );

                    if (result != null && result is Map<String, dynamic>) {
                      setState(() {
                        username = result['username'];
                        // 如果需要显示密码可以根据需求取出密码进行处理
                      });
                    }
                  },
                  icon: Icon(Icons.edit),
                  label: Text('编辑个人信息'),
                ),

                SizedBox(height: 10.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // 设置按钮逻辑
                    // 在这里可以添加设置的代码
                  },
                  icon: Icon(Icons.settings),
                  label: Text('设置'),
                ),
                SizedBox(height: 10.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // 退出登录按钮逻辑
                    // 在这里可以添加退出登录的代码
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginRegisterPage()),
                    );
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text('退出登录'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

