//этот ланчер позволяет запускать сылки в отдельном окне встроенного браузера
import 'package:url_launcher/url_launcher.dart';  //для работы canLaunch и launch

//ф-я для запуска сслыки в отдельном окне браузера
//в нее пробрасываем ссылку
Future<void> launchUniversalLink(String url) async {
  //если ф-я кенЛанч(из url_launcher.dart) вернула истину
  //предположительно - "возжожность перейти по ссылке"
  if(await canLaunch(url)) {
    //в перем. типа булл вернуть истину или ложь из ф-ии ланч(из url_launcher.dart)
    final bool nativeAppLaunch = await launch(url, forceSafariVC: false, universalLinksOnly: true);
    //и уже если эта переменная ложная(то есть обратная !истина)
    if (!nativeAppLaunch) {
      //то опять запускаем ф-ю ланч(из url_launcher.dart) с ссылкой и ложным форсСафариВС
      await launch(url, forceSafariVC: false);
    }
  }
}