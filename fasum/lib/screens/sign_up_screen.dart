import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _username;
  String? _password;

  // Fungsi untuk menangani aksi Sign Up
  void _signUp() {
    setState(() {
      _username = _usernameController.text;
      _password = _passwordController.text;
    });
    print('Username: $_username');
    print('Password: $_password');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign Up Successful!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(  // Membungkus SingleChildScrollView untuk mencegah masalah layout overflow
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Menyusun elemen secara vertikal di tengah
              crossAxisAlignment: CrossAxisAlignment.center,  // Menyusun elemen secara horizontal di tengah
              children: [
                // Field untuk username
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Field untuk password
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Tombol Sign Up
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
