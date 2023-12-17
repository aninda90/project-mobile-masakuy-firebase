import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  final String image, name, category, recipe;

  const DescPage({
    Key? key,
    required this.image,
    required this.name,
    required this.category,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD65A00),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.network(
                image,
                height: 250,
                 width: double.infinity,
              fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(top: 1, bottom: 1),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        recipe,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
