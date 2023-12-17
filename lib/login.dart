import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masakuy_api/navbar.dart';
import 'package:masakuy_api/services/firebase_auth_service.dart';
import 'package:masakuy_api/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  void login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = 
        await _authService.loginWithEmailandPassword(email, password, context);
    
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Success",
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Navbar()));
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Failed",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 99, 95, 95),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(
                color: Color(0xFFD65A00),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xFFD65A00),
                ),
                hintText: "Email Address",
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.key,
                  color: Color(0xFFD65A00),
                ),
                hintText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD65A00),
                ),
                onPressed: () {
                  login();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?"),
                const SizedBox(width: 4.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register()));
                  },
                  child: const Text(
                    "Daftar disini",
                    style: TextStyle(
                      color: Color(0xFFD65A00),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ), 
      ),
    );
  }
}