class FoodForm {
  String name;
  String unit;
  String composition;
  String temperature;
  String spoiled;
  String nutritional;
  String energy;
  String normativeDocument;
  String declarate;
  String image;

  FoodForm(
      this.name,
      this.unit,
      this.composition,
      this.temperature,
      this.spoiled,
      this.nutritional,
      this.energy,
      this.normativeDocument,
      this.declarate,
      this.image
      );

  factory FoodForm.fromJson(dynamic json) {
    return FoodForm(
        "${json['name']}",
        "${json['unit']}",
        "${json['composition']}",
        "${json['temperature']}",
        "${json['spoiled']}",
        "${json['nutritional']}",
        "${json['energy']}",
        "${json['normativeDocument']}",
        "${json['declarate']}",
        "${json['image']}"
    );
  }
}