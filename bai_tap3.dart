import 'package:flutter/material.dart';

class BaiTap3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bai Tap 3',
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
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createColorRoute(
                  DetailPage(),
                  Colors.orange,
                ));
              },
              child: Text('Go to Detail page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_createColorRoute(
                  AboutPage(),
                  Colors.pink,
                ));
              },
              child: Text('Go to About page'),
            ),
          ],
        ),
      ),
    );
  }
}

PageRouteBuilder _createColorRoute(Widget targetPage, Color backgroundColor) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => targetPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Interpolate between colors
      final colorAnimation = ColorTween(
        begin: Colors.white, // Start color
        end: backgroundColor, // End color
      ).animate(animation);

      return AnimatedBuilder(
        animation: colorAnimation,
        builder: (context, _) {
          return Container(
            color: colorAnimation.value, // Set the animated background color
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      );
    },
    transitionDuration: Duration(seconds: 1), // Adjust transition duration
  );
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Center(
        child: Text(
          'Welcome to the Detail Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),
      ),
      body: Center(
        child: Text(
          'Welcome to the About Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
