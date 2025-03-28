import 'package:fasum/screens/home_screen.dart';
import 'package:fasum/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _username;
  String? _password;

  // Fungsi untuk menangani aksi Sign In
  void _signIn() {
    setState(() {
      _username = _usernameController.text;
      _password = _passwordController.text;
    });

    if (_username != null && _password != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign In Successful!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: SingleChildScrollView(  // Menghindari masalah layout overflow
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Menyusun elemen di tengah vertikal
              crossAxisAlignment: CrossAxisAlignment.center,  // Menyusun elemen di tengah horizontal
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

                // Tombol Sign In
                ElevatedButton(
                  onPressed: _signIn,
                  child: Text('Sign In'),
                ),
                SizedBox(height: 16),

                // Tombol untuk pindah ke Sign Up
                TextButton(
                  onPressed: () {
                    // Navigasi ke halaman Sign Up
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
