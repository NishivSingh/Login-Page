import 'package:flutter/material.dart';
import 'package:sleeksites_login_page/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
      },
    );
  }
}
