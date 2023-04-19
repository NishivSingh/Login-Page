import 'package:flutter/material.dart';
import 'package:sleeksites_login_page/login_page.dart';
import 'package:sleeksites_login_page/secret_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    String? username = await storage.read(key: 'username');
    String? password = await storage.read(key: 'password');

    if (username != null && password != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/secret');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/secret': (context) => SecretPage(),
      },
    );
  }
}
