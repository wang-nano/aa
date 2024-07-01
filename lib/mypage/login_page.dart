import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/pages/my_page.dart';
import '../navigator/tab_navigator.dart';
import 'register_page.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '用户登录',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginRegisterPage(),
    );
  }
}

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    if (savedUsername == null || savedPassword == null ||
        savedUsername != _emailController.text || savedPassword != _passwordController.text) {
      // 如果用户名或密码未注册或输入的与保存的不匹配，弹出提示弹窗
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('提醒'),
          content: Text('用户名或密码错误，请重新输入！'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
              child: Text('确定'),
            ),
          ],
        ),
      );
    } else {
      // 用户名和密码均存在且匹配，继续登录逻辑
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabNavigator()),
      );
    }
  }


  void _register() {
    // Here you can add your register logic
    // For simplicity, we will just navigate to Home Page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户登录'),
        centerTitle: true, // 将标题居中显示
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: '用户名'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '密码'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('登录'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _register,
              child: Text('注册'),
            ),
          ],
        ),
      ),
    );
  }
}