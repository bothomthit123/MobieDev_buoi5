import 'package:flutter/material.dart';

void main() {
  runApp(BaiTap4());
}

class BaiTap4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bai Tap 4 của Như Quỳnh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ Flutter của Như Quỳnh'),
      ),
      body: Container(
        color: Color(0xFFE9F2FF),
        child: Center(
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Image.network(
              'https://blog.solguruz.com/wp-content/uploads/2023/11/Flutter-for-Hybrid-Apps-Why-Flutter-is-the-Best-Platform-to-Make-Hybrid-Apps.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Thêm tên tương ứng cho từng tài khoản trong _userDatabase
  final Map<String, Map<String, String>> _userDatabase = {
    "admin": {"password": "1234", "name": "Bùi Thị Như Quỳnh"},
    "Như Quỳnh": {"password": "password1", "name": "Như Quỳnh"},
    "user2": {"password": "password2", "name": "User 2"},
  };

  void _handleLogin(BuildContext context) {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (_userDatabase.containsKey(username) &&
        _userDatabase[username]?["password"] == password) {
      // Lấy tên người dùng từ database
      String name = _userDatabase[username]?["name"] ?? "User";

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(info: name), // Truyền tên vào DetailPage
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sai tài khoản hoặc mật khẩu!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Đăng Nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Tên đăng nhập',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _handleLogin(context),
              child: Text('Đăng Nhập'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String info;

  DetailPage({required this.info}); // Nhận tên từ LoginPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Chi Tiết'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome $info', // Hiển thị tên người dùng
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: Center(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWxHBv8A-pzUvOl8YSPSTHethKaKgFK2GUHg&s',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
