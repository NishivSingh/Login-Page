import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({Key? key}) : super(key: key);

  @override
  _SecretPageState createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secret Page'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.lock_outline,
                size: 80,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to the Secret Page!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  await storage.delete(key: 'username');
                  await storage.delete(key: 'password');
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 5,
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
