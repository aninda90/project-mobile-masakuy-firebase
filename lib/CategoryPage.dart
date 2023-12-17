import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:masakuy_api/DescPage.dart';
import 'package:masakuy_api/services/database_service.dart';
import 'package:masakuy_api/services/firestore_service.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  final List<DataRecipe> dataForcategory; // Add this parameter

  const CategoryPage(
      {Key? key, required this.category, required this.dataForcategory})
      : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        backgroundColor: Color(0xFFD65A00), // Tampilkan nama kategori di app bar
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FireStoreService.getByCategory(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Or any other loading indicator
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No data available');
          }

          List<DocumentSnapshot> data = snapshot.data!.docs;

          return ListView.builder(
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
                            vertical: 15, horizontal: 15),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  document['avatar'],
                                  width: 150, // Set width to 150
                                  height: 150, // Set height to 150
                                  fit: BoxFit
                                      .cover, // Ensure the image covers the entire box
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(height: 15),
                                  Text(
                                    document['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      document['category'],
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
    );
  }
}
