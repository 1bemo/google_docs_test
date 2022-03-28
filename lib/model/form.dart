/// FeedbackForm это класс с данными
class FeedbackForm {
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

  FeedbackForm(
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

  //метод фромДжейсон, вовращает объект, класса ФидбэкФорм с данными из джейсон запроса
  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
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

  /*
  // Структура (мапа) раскидывает стринг переменные по полям ключ-значение
  Map toJson() => {
    'name': name,
    'unit': unit,
    'composition': composition,
    'temperature': temperature
  };
   */
}