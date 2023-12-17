import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masakuy_api/CategoryPage.dart';
import 'package:masakuy_api/DescPage.dart';
import 'package:masakuy_api/services/firestore_service.dart';
import 'package:masakuy_api/services/database_service.dart';
import 'package:masakuy_api/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<DataRecipe> data = data_user.map((e) => DataRecipe.fromJson(e)).toList();
  List<DataRecipe> data2 =
      data_user2.map((e) => DataRecipe.fromJson(e)).toList();
  List<DataRecipe> datafood =
      data_food.map((e) => DataRecipe.fromJson(e)).toList();
  List<DataRecipe> databeverage =
      data_beverage.map((e) => DataRecipe.fromJson(e)).toList();
  List<DataRecipe> datapastry =
      data_pastry.map((e) => DataRecipe.fromJson(e)).toList();

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ... Bagian atas aplikasi
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              height: 107,
              color: const Color(0xFFD65A00),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Halo, ${_currentUser?.username ?? ''}", // Ganti dengan nama pengguna
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Mau masak apa hari ini?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Kategori
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
// Kategori - Food
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF292B37).withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                      category: "Food",
                                      dataForcategory: datafood,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.fastfood,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Food",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Kategori - Beverage
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF292B37).withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                      category: "Beverage",
                                      dataForcategory: databeverage,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.local_cafe,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Beverage",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Kategori - Pastry
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF292B37).withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryPage(
                                      category: "Pastry",
                                      dataForcategory: datapastry,
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.bakery_dining,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Pastry",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Populer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Popular",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Daftar resep populer
            Container(
              height: 200,
              child: StreamBuilder<QuerySnapshot>(
                stream: FireStoreService.getData("new"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No data available');
                  }

                  List<DocumentSnapshot> data = snapshot.data!.docs;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var document = data[index].data() as Map<String, dynamic>;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescPage(
                                image: document['avatar'],
                                name: document['name'],
                                category: document['category'],
                                recipe: document['recipe'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          color: Color(0xFFD65A00),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  document['avatar'],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  document['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Latest Recipe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Daftar resep terbaru
            Container(
              height: 800,
              child: StreamBuilder<QuerySnapshot>(
                stream: FireStoreService.getData("latest"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No data available');
                  }

                  List<DocumentSnapshot> data = snapshot.data!.docs;

                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var document = data[index].data() as Map<String, dynamic>;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DescPage(
                                image: document['avatar'],
                                name: document['name'],
                                category: document['category'],
                                recipe: document['recipe'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          color: Color(0xFFD65A00),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 15,
                                ),
                                height: 130,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.network(
                                          document['avatar'],
                                          width: 100,
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 10),
                                          Text(
                                            document['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            width: 150,
                                            child: Text(document['category']),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
