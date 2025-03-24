import 'package:flutter/material.dart';
import 'bai_tap1.dart'; // Import màn hình bài tập 1
import 'bai_tap2.dart';
import 'bai_tap3.dart';
import 'bai_tap4.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Menu')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          MenuButton(
            title: 'Bài Tập 1',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BaiTap1()),
              );
            },
          ),
          // Thêm các bài tập khác tương tự
          MenuButton(
            title: 'Bài Tập 2',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BaiTap2()),
              );
            },
          ),
          MenuButton(
            title: 'Bài Tập 3',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BaiTap3()),
              );
            },
          ),
          MenuButton(
            title: 'Bài Tập 4',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BaiTap4()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  MenuButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
