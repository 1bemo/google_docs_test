///ФАЙЛ С КУБИТОМ СВЯЗАННЫЙ С НЬЮВСсТЕЙТ

import 'package:bloc/bloc.dart';  //тут кубит
import 'package:dart_rss/dart_rss.dart';  //тут RssFeed
import 'package:meta/meta.dart';  //тут @immutable в файле ньювсСтейт
import 'package:http/http.dart' as http;

//связваем с файлом стейт
part 'news_state.dart';

//ссылка на RSS с лента.ру
const _top7UR = 'https://lenta.ru/rss/top7';

//класс, наследующий от Кубит класса из bloc.dart с pub.dev
//в Кубит будет тип НьювсСтейт, созданный в связанном файле
class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  //асинхр. ф-я лоадНьювс(загрузка новостей) типа Future<void>
  Future<void> loadNews() async {
    //обязательно через трай/кэтч из-за непредсказуемых ошибок
    try {
      //ожидание в 1 сек до загрузки
      await Future.delayed(const Duration(seconds: 1));
      //в респонс получаем данные из ссылки
      final response = await http.Client().get(Uri.parse(_top7UR));
      //в рссФид парсим данные, полученные в респонс с помощью РссФид класса из pub.dev
      final rssFeed = RssFeed.parse(response.body);
      //эмит - подключается из блок.дарт вместе с Кубит
      //в него помещается ньювсЛоадедСтейт класс, наследуемый от ньювсСтейт
      //а в него помещаем айтемс из парсированной переменной рссФид
      //что конкрентно делает эмит - хз, но без него  - бесконечная загрузка
      //предположительно - выводит полученное для дальнейшей обработки
      emit(NewsLoadedState(rssFeed.items));
    } catch (e) {
      //в случае ошибки вернуть Упссс через ньювсЭрорСтейт
      //через тот же эмит
      emit(NewsErrorState('Упссс!'));
    }
  }

  //ф-я перезагрузки новостей
  Future<void> reloadNews() async {
    //опять этот эмит, только уже с ньювсИнитиал
    emit(NewsInitial());
  }
}
