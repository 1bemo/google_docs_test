import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'food_form.dart';

class FoodController {
  static const String url = 'https://script.google.com/macros/s/AKfycbyg9c9TFvCJaLF3bBW7iWBKzDenLJJTBi5c5zTVR6uU3aoLlJ0a/exec';

  Future<List> getCategoryList() async {
    return await http.get(Uri.parse(url)).then((resp) {
      var jsonCategory = convert.jsonDecode(resp.body) as List;
      return jsonCategory;
    });
  }

  Future<List<FoodForm>> getFoodList() async {
    return await http.get(Uri.parse(url)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FoodForm.fromJson(json)).toList();
    });
  }
}