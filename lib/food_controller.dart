import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'food_form.dart';

List namesCategory = <String>[
  'Вареные колбасы',
  'Варено-копченые колбасы',
  'Сырокопченая продукция',
  'Полукопченые колбасы',
  'Ветчины',
  'Сосиски, сардельки',
  'Паштеты',
  'Продукты в желе',
  'Полуфабрикаты охлажденные',
  'Полуфабрикаты замороженные',
  'Варенники, пельмени',
  'Рёбра',
  'Деликатесы',
  '"Мясная Пекарня"',
  'Выпечка',
];

List imagesCategory = <String>[
  'lib/assets/1.png',
  'lib/assets/2.png',
  'lib/assets/3.png',
  'lib/assets/4.png',
  'lib/assets/5.png',
  'lib/assets/6.png',
  'lib/assets/7.png',
  'lib/assets/8.png',
  'lib/assets/9.png',
  'lib/assets/9.png',
];

List _urlsCategory = <String>[
  'https://script.google.com/macros/s/AKfycbz_9ET-xOK12q8kz58OejGrFLKMoecEb_0LxYfSS39KQ2s6glw/exec',
  'https://script.google.com/macros/s/AKfycbzsbE3Y0TZmps4KQwvFBGyQD8lfLDJiUwA27mbX1W1sYETvErTo/exec',
  'https://script.google.com/macros/s/AKfycbwsU7prH7s0yuBa4AivFE8xo4fh6YqDxDDBmOKtuQDPvlZsBFY/exec',
  'https://script.google.com/macros/s/AKfycbwDrlyy9r00nqN4XcTEvWRIFTz23sTrDNpSMJO0hhtBL_gGkog2/exec',
  'https://script.google.com/macros/s/AKfycbwQzeFygKGdAVGQmCY5_cJs-tHYGIg5VgTLL2jElOGw4JYAYw8/exec',
  'https://script.google.com/macros/s/AKfycbxAg0jJj0-zXgwPSUydG3gNZIAgKb_w4wpApFgLr2IdN4SnHlBd/exec',
  'https://script.google.com/macros/s/AKfycbzHHfDzdso3XusLUnyrhfMWhaRQIgBH87APSsJrW2KzXpGJ53Y/exec',
  'https://script.google.com/macros/s/AKfycbxCVC36CcW8S3pQ8iUAVm_8z-bvMl0BCn1x326JUTd_oxpakxlq/exec',
  'https://script.google.com/macros/s/AKfycbwdIK5vAw2kDrKiSwI9mCtJj6XeQix3KQrDxWf--TaqJudhLvrd/exec',
  'https://script.google.com/macros/s/AKfycbz3WxvO_TuWWzWr_xXsVWBrod9hV5N80qK8rPzljsLSI2LBx9jU/exec',
  'https://script.google.com/macros/s/AKfycbwGG8xPtl8ohnU0DF9Tjr33hnmsSD2XeMaK-3AUWnZXB0LmODk/exec',
  'https://script.google.com/macros/s/AKfycbxqMRQam0MJKfkyscUOexc4HFlI67hPXyQiqSVvtdC06lUr4Cw/exec',
  'https://script.google.com/macros/s/AKfycbwQQTv7PgzOossecNHlsaTbAt9F1kEeZ_sASrTz2mwubsq9Tu8/exec',
  'https://script.google.com/macros/s/AKfycbxAO9lYgS4QCjXQwzkiHSjJDZsWeZp6sVbJrjbs_KBxb2-YvUxT/exec',
  'https://script.google.com/macros/s/AKfycbz6ATCFB5IMAieI_oCiKfaYafIvHQ3AqDPId-7fV8EUZ7PHaag/exec',
];

class FoodController {
  static const String urlCategory = 'https://script.google.com/macros/s/AKfycbyg9c9TFvCJaLF3bBW7iWBKzDenLJJTBi5c5zTVR6uU3aoLlJ0a/exec';
  String urlFL = _urlsCategory[namesCategory.indexOf('Вареные колбасы')];

  Future<List> getCategoryList() async {
    return await http.get(Uri.parse(urlCategory)).then((resp) {
      var jsonCategory = convert.jsonDecode(resp.body) as List;
      return jsonCategory;
    });
  }

  Future<List<FoodForm>> getFoodList(String nameFl) async {
    urlFL = _urlsCategory[namesCategory.indexOf(nameFl)];
    //urlFL = _urlsCategory[1];

    return await http.get(Uri.parse(urlFL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FoodForm.fromJson(json)).toList();
    });
  }
}