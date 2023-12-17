import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:masakuy_api/login.dart';
import 'package:masakuy_api/services/firestore_service.dart';
import 'package:masakuy_api/services/database_service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      final email = user.email;
      if (email != null) {
        final myUser = await FireStoreService.getUser(email: email);
        if (myUser != null) {
          setState(() {
            _currentUser = myUser;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: Color(0xFFD65A00),
    elevation: 0,
    iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
    leading: IconButton(
      icon: Icon(Icons.logout),
      onPressed: () {
        _auth.signOut();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      },
    ),
  ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            if (_currentUser != null)
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/5987/5987424.png"), // Pastikan ini benar
              ),
            const SizedBox(height: 20),
            if (_currentUser == null)
              Center(
                child: Container(
                  width: 60.0, // Lebar container
                  height: 60.0, // Tinggi container
                  decoration: BoxDecoration(
                    shape: BoxShape
                        .circle, // Mengatur bentuk container menjadi lingkaran
                    color: Colors.white, // Warna latar belakang container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Warna bayangan
                        blurRadius: 6.0, // Radius bayangan
                        spreadRadius: 1.0, // Sebaran bayangan
                      ),
                    ],
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
              )
            else
              Column(
                children: [
                  ProfileInfo("Username", _currentUser?.username ?? ""),
                  const SizedBox(height: 20),
                  ProfileInfo("Nama Lengkap", _currentUser?.fullname ?? ""),
                  const SizedBox(height: 20),
                  ProfileInfo("Email", _currentUser?.email ?? ""),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfo(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      height: 80,
      width: 800,
      decoration: BoxDecoration(
        color: Color(0xFFD65A00),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Color(0xFFD65A00).withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins Light',
              fontSize: 12,
            ),
          ),
          SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins Light',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
