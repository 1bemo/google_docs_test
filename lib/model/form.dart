/// FeedbackForm это класс с данными
class FeedbackForm {
  String name;
  String age;
  String phone;
  String someText;

  FeedbackForm(this.name, this.age, this.phone, this.someText);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['name']}",
        "${json['age']}",
        "${json['phone']}",
        "${json['someText']}"
    );
  }

  // Метод для получения параметров
  Map toJson() => {
    'name': name,
    'age': age,
    'phone': phone,
    'someText': someText
  };
}