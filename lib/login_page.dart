import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Neumorphic(
                  style: const NeumorphicStyle(
                    depth: -8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: -8,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(16),
                            ),
                          ),
                          child: TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: -8,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(16),
                            ),
                          ),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        NeumorphicButton(
                          onPressed: () async {
                            await storage.write(
                                key: 'username',
                                value: usernameController.text);
                            await storage.write(
                                key: 'password',
                                value: passwordController.text);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(context, '/secret');
                          },
                          style: NeumorphicStyle(
                            depth: 4,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(16),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
