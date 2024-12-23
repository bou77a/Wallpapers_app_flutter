class WallpaperModel {
  // Private fields
  String? _photographer;
  String? _photographerUrl; // Use camelCase consistently
  int? _photographerId;
  SrcModel? _src;

  // Constructor
  WallpaperModel({
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    SrcModel? src,
  })  : _photographer = photographer,
        _photographerUrl = photographerUrl,
        _photographerId = photographerId,
        _src = src;

  // Getters
  String? get photographer => _photographer;

  String? get photographerUrl => _photographerUrl;

  int? get photographerId => _photographerId;

  SrcModel? get src => _src;

  // Setters
  set photographer(String? value) {
    _photographer = value;
  }

  set photographerUrl(String? value) {
    _photographerUrl = value;
  }

  set photographerId(int? value) {
    _photographerId = value;
  }

  set src(SrcModel? value) {
    _src = value;
  }
}

/// ------------------------------------------------------------------------
class SrcModel {
  String? _original;
  String? _small;
  String? _portrait; // Fix the typo ("portrai")

  // Constructor
  SrcModel({String? original, String? small, String? portrait})
      : _original = original,
        _small = small,
        _portrait = portrait;

  // Getters
  String? get original => _original;

  String? get small => _small;

  String? get portrait => _portrait;

  // Setters
  set original(String? value) {
    _original = value;
  }

  set small(String? value) {
    _small = value;
  }

  set portrait(String? value) {
    _portrait = value;
  }
}
