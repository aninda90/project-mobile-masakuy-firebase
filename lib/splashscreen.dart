import 'package:flutter/material.dart';
import 'package:masakuy_api/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(192, 0, 0, 0), // Mengubah latar belakang menjadi transparan
      body: Stack(
        children: [
          Container(
            width: 1920,
            height: 1080,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1166383806/id/vektor/berbagai-hidangan-masak-makanan-yang-digambar-tangan-mendingankan-pola-sketsa-kapur-putih.jpg?s=612x612&w=0&k=20&c=pgLIWsYI_4_EnN6WHTvh9RMp3dO9wKbNwwxaDL7c7RE='),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), // Mengatur opacity ke 70%
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Masakuy",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 17),
                        Text(
                          "Bingung masak apa? Masakuy aja!",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFD65A00),
                        border: Border.all(width: 2, color: Colors.white),
                      ),
                      height: 50,
                      width: 500 * 0.7,
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 27),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
