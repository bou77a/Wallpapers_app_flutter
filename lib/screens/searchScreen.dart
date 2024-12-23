import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widgets/wallpapers_list.dart';
import 'package:wallpaper_app/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery; // Mark this as final and required

  SearchScreen({required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers = [];

  // Fetch wallpapers using the search query
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
    super.initState();
    searchController.text = widget.searchQuery; // Initialize with passed query
    fetchWallpapers(widget.searchQuery); // Fetch wallpapers for initial query
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Search ....",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: KmainBlueColor,
                    ),
                    onTap: () {
                      final query = searchController.text.trim();
                      if (query.isNotEmpty) {
                        fetchWallpapers(query);
                      }
                    },
                  )
                ],
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
