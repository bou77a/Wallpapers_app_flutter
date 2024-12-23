import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';

class WallpapersList extends StatelessWidget {
  final List<WallpaperModel> wallpapersList;

  const WallpapersList({super.key, required this.wallpapersList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
        ),
        itemCount: wallpapersList.length,
        itemBuilder: (context, index) {
          final wallpaper = wallpapersList[index];

          return GridTile(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                wallpaper.src?.portrait ?? "",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
