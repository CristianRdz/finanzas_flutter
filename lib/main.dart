import 'package:finanzas_flutter/auth/screens/confirm_code.dart';
import 'package:finanzas_flutter/auth/screens/login.dart';
import 'package:finanzas_flutter/auth/screens/new_password.dart';
import 'package:finanzas_flutter/auth/screens/recover.dart';
import 'package:finanzas_flutter/auth/screens/register.dart';
import 'package:finanzas_flutter/home/screens/home.dart';
import 'package:finanzas_flutter/home/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const Login(),
        '/recover': (context) => const Recover(),
        '/register': (context) => const Register(),
        '/confirm_code': (context) => const ConfirmCode(),
        '/new_password': (context) => const NewPassword(),
      },
    );
  }
}
