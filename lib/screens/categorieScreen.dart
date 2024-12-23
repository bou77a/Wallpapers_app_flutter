import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/wallpapers_list.dart';
import 'package:wallpaper_app/widgets/widgets.dart';

class CategorieScreen extends StatefulWidget {
  final String categorieName;
  CategorieScreen({required this.categorieName});

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  List<WallpaperModel> wallpapers = [];

  void fetchWallpapers(String query) async {
    wallpapers =
        await getSearchWallpapers(query); // Adjust your method accordingly
    print("Wallpapers fetched: ${wallpapers.length}");
    for (var wallpaper in wallpapers) {
      print(wallpaper.src?.portrait);
    }
    setState(() {}); // Update the UI with the new list
  }

  @override
  void initState() {
    fetchWallpapers(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              decoration: BoxDecoration(
                color: KbackgroundWidgetColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const SizedBox(height: 15),
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: WallpapersList(
                    wallpapersList: wallpapers)), // Show loader while fetching
          ],
        ),
      ),
    );
  }
}
