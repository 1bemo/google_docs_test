import 'dart:convert' as convert; //для конвертирования джейсон строки и работы с ней
import 'package:flutter/foundation.dart'; //для отладки
import 'package:http/http.dart' as http;  //для использования джейсон

//прочие файлы
import '../model/form.dart';

//FormController — это класс, который сохраняет данные в Google таблицу, используя
// HTTP-запрос GET по URL-адресу веб-сайта Google App Script, анализирует ответ и отправляет обратный вызов результата.
class FormController {

  // статическая неизменяемая строковая переменная юрл - это ссылка нашего макроса
  static const String url = "https://script.google.com/macros/s/AKfycbyPD9Z2dQbpkrKIk48nWCgTK8Q6HQkotWGTMjtwTDEdLjYZBss/exec";

  ///--------------------------ТУТ НАДО ТУПО ВСЕ ЗАПОМНИТЬ
  // Асинхронная функция, которая сохраняет данные, анализирует параметры
  // и отправляет запрос HTTP GET на url. При успешном ответе вызывается [обратный вызов].
  //в нее передается объект класса фидбекФорм и ф-я исполняемая калбэк
  void submitForm(FeedbackForm feedbackForm, void Function(String) callback) async {
    //во избежание ошибок
    try {
      //с ожиданием отправляемся с помощью метода http.post по ссылке макроса
      //и эти данные используем в методе фидбекФорм.туДжейсон
      //.then (потом) опять асинхронная ф-я, где response - наши данные из запроса
      await http.post(Uri.parse(url), body: feedbackForm.toJson()).then((response) async {
        //если у наших данных статусКод = 302
        if (response.statusCode == 302) {
          //то в переменную новую url вставляем данные из response.headers по ключу location
          var url = response.headers['location'];
          //с ожиданием опять лезем уже методом .get по ссылке из ключа location
          await http.get(Uri.parse(url!)).then((response) {
            //и потом в переданную ф-я вставляем данные из convert.jsonDecode(response.body) по ключу статус
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          //иначе сразу в переданную ф-я вставляем эти данные
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      //в случае ошибки в консоль выводим саму ошибку
      if (kDebugMode) print(e);
    }
  }

  //асинхр. ф-я, ктр возвращает список с гугл таблицы
  Future<List<FeedbackForm>> getFeedbackList() async {
    return await http.get(Uri.parse(url)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }
}