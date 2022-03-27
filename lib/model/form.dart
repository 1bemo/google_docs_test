/// FeedbackForm это класс с данными
class FeedbackForm {
  String name;
  String unit;
  String composition;
  String temperature;

  FeedbackForm(this.name, this.unit, this.composition, this.temperature);

  //метод фромДжейсон, вовращает объект, класса ФидбэкФорм с данными из джейсон запроса
  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['name']}",
        "${json['unit']}",
        "${json['composition']}",
        "${json['temperature']}"
    );
  }

  // Структура (мапа) раскидывает стринг переменные по полям ключ-значение
  Map toJson() => {
    'name': name,
    'unit': unit,
    'composition': composition,
    'temperature': temperature
  };
}