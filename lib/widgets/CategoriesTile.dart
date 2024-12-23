import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/categorieScreen.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    super.key,
    required this.imgUrl, // Default image URL
    required this.title, // Default title
  });

  final String? imgUrl, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Container(),
            Center(
              child: Text(
                "data",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategorieScreen(categorieName: title!.toLowerCase())));
      },
    );
  }
}
