import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('finanzas.png', width: 200),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'ejemplo@gmail.com',
                  label: Text('Correo electrónico'),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _email,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '...',
                  icon: const Icon(Icons.lock),
                  label: const Text('Contraseña'),
                  labelStyle: const TextStyle(color: Colors.black),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: _password,
                obscureText: _obscureText,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      setState(() {
                        _loading = true;
                      });
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _email.text,
                        password: _password.text,
                      );
                      setState(() {
                        _loading = false;
                      });
                      if (credential.user != null) {
                        Navigator.pushNamed(context, '/home');
                      }
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        _loading = false;
                      });
                      String message;
                      if (e.code == 'user-not-found') {
                        message = 'No user found for that email.';
                      } else if (e.code == 'wrong-password') {
                        message = 'Wrong password provided for that user.';
                      } else {
                        message = 'An error occurred. Please try again.';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    }
                  },
                  child: _loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Iniciar sesión'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/recover');
                },
                child: const Text('Recuperar contraseña'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
