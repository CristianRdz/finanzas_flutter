import 'package:flutter/material.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  final TextEditingController _code = TextEditingController();

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
                  icon: Icon(Icons.numbers),
                  hintText: '1234..',
                  label: Text('Codigo de recuperacion'),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
                controller: _code,
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
                  onPressed: () {
                    //navigate to new password
                    Navigator.pushNamed(context, '/new_password');
                    
                  },
                  child: const Text('Validar codigo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}