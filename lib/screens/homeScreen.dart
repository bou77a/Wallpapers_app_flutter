import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/CategoriesTile.dart';
import 'package:wallpaper_app/widgets/wallpapers_list.dart';
import 'searchScreen.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  List<WallpaperModel> wallpapers = [];

  List<CategoriesModel> categories = [];

  TextEditingController searchController = new TextEditingController();

  void fetchWallpapers() async {
    wallpapers = await getTrendingWallpapers();
    print(
        "Wallpapers fetched: ${wallpapers.length}"); // Check the number of wallpapers fetched
    for (var wallpaper in wallpapers) {
      print(wallpaper.src?.portrait); // Verify each wallpaper URL
    }
    setState(() {}); // Ensure the UI updates after fetching data
  }

  @override
  void initState() {
    fetchWallpapers();
    categories = getCategories();

    test_test();

    super.initState();
  }

  void test_test() {
    wallpapers.forEach((wallpaper) {
      print(wallpaper.src?.portrait); // Verify each URL
    });
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
              margin: EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              decoration: BoxDecoration(
                  color: KbackgroundWidgetColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "search ....",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: KmainBlueColor,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                  searchQuery: searchController.text)));
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 50,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    title: categories[index].categorieName,
                    imgUrl: categories[index].imgUrl,
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: WallpapersList(wallpapersList: wallpapers)),
          ],
        ),
      ),
    );
  }
}
