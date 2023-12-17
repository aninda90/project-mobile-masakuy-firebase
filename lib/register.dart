import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masakuy_api/services/firebase_auth_service.dart';
import 'package:masakuy_api/services/firestore_service.dart';
import 'package:masakuy_api/services/database_service.dart';
import 'package:masakuy_api/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    String fullname = _fullnameController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
  
    User? user =
        await _authService.signUpWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "User is Sucessfully created",
          ),
          backgroundColor: Colors.green,
        ),
      );

    final myUser = MyUser(
                  // Menggunakan nama kelas MyUser yang telah diganti
                  fullname: fullname,
                  email: email, // Alamat email pengguna
                  username: username,
                );

                await FireStoreService.tambahUser(user: myUser); // Menggunakan MyUser

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
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
              "REGISTER",
              style: TextStyle(
                color: Color(0xFFD65A00),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20.0),
                        TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.ad_units_rounded,
                  color: Color(0xFFD65A00),
              ),
                hintText: "Username",
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _fullnameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box_rounded,
                  color: Color(0xFFD65A00),
                ),
                hintText: "Full Name",
              ),
            ),
            const SizedBox(height: 12.0),
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
              decoration: InputDecoration(
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
                  register();
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                        "Sudah punya akun?",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                const SizedBox(width: 8.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    "Masuk",
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
