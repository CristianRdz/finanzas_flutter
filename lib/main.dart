
import 'package:finanzas_flutter/auth/screens/confirm_code.dart';
import 'package:finanzas_flutter/auth/screens/login.dart';
import 'package:finanzas_flutter/auth/screens/new_password.dart';
import 'package:finanzas_flutter/auth/screens/recover.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/recover': (context) => const Recover(),
        '/confirm_code': (context) => const ConfirmCode(),
        '/new_password': (context) => const NewPassword(),
      },
    );
  }
}
