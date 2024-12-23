import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/constants.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];

  /// CategoriesModel? categoriesModel = CategoriesModel();

  categories.add(CategoriesModel(
    categorieName: "Nature",
    imgUrl: "https://via.placeholder.com/150/92c952",
  ));
  categories.add(CategoriesModel(
    categorieName: "Nature",
    imgUrl: "https://via.placeholder.com/150/92c952",
  ));
  categories.add(CategoriesModel(
    categorieName: "Nature",
    imgUrl: "https://via.placeholder.com/150/92c952",
  ));
  categories.add(CategoriesModel(
    categorieName: "Nature",
    imgUrl: "https://via.placeholder.com/150/92c952",
  ));
  categories.add(CategoriesModel(
    categorieName: "Nature",
    imgUrl: "https://via.placeholder.com/150/92c952",
  ));
  categories.add(CategoriesModel(
    categorieName: "Nature",
    imgUrl: "https://via.placeholder.com/150/92c952",
  ));
  categories.add(CategoriesModel(
    categorieName: "Nature",
    imgUrl: "https://via.placeholder.com/150/92c952",
  ));

  return categories;
}

Future<List<WallpaperModel>> getTrendingWallpapers() async {
  final url = Uri.parse("https://api.pexels.com/v1/curated?per_page=30");
  List<WallpaperModel> wallpapers_list = [];

  try {
    final response = await http.get(
      url,
      headers: {"Authorization": APIkey}, // Add your API key in the headers
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body); // Decode the JSON response
      List<dynamic> photos = data["photos"];

      // Print all URLs to ensure data is fetched correctly (for debugging)
      photos.forEach((photo) {
        WallpaperModel wallpaperModel = WallpaperModel(
          photographer: photo["photographer"], // Set photographer name
          photographerUrl: photo["photographer_url"], // Set photographer URL
          photographerId: photo["photographer_id"], // Set photographer ID
          src: SrcModel(
            original: photo["src"]["original"], // Set original image URL
            small: photo["src"]["small"], // Set small image URL
            portrait: photo["src"]["portrait"], // Set portrait image URL
          ),
        );

        wallpapers_list.add(wallpaperModel);
      });

      return wallpapers_list;
      // Return the full list of photos
    } else {
      throw Exception(
          "Failed to fetch data. Status Code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return [];
  }
}

Future<List<WallpaperModel>> getSearchWallpapers(String query) async {
  final url =
      Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=15");

  List<WallpaperModel> wallpapers_list = [];

  try {
    final response = await http.get(
      url,
      headers: {"Authorization": APIkey}, // Add your API key in the headers
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body); // Decode the JSON response
      List<dynamic> photos = data["photos"];

      // Print all URLs to ensure data is fetched correctly (for debugging)
      photos.forEach((photo) {
        WallpaperModel wallpaperModel = WallpaperModel(
          photographer: photo["photographer"], // Set photographer name
          photographerUrl: photo["photographer_url"], // Set photographer URL
          photographerId: photo["photographer_id"], // Set photographer ID
          src: SrcModel(
            original: photo["src"]["original"], // Set original image URL
            small: photo["src"]["small"], // Set small image URL
            portrait: photo["src"]["portrait"], // Set portrait image URL
          ),
        );

        wallpapers_list.add(wallpaperModel);
      });

      return wallpapers_list;
      // Return the full list of photos
    } else {
      throw Exception(
          "Failed to fetch data. Status Code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
