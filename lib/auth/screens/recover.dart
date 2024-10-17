import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Recover extends StatefulWidget {
  const Recover({super.key});

  @override
  State<Recover> createState() => _RecoverState();
}

class _RecoverState extends State<Recover> {
  final TextEditingController _email = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: _email.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send email: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar contraseña'),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
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
                  onPressed: _sendPasswordResetEmail,
                  child: const Text('Enviar codigo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
