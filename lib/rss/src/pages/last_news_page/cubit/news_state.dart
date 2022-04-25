///ФАЙЛ СТЕЙТ, СВЯЗАННЫЙ С КУБИТОМ НЬЮВСкУБИТ

//указываем, что этот файл связан с кубит файлом
part of 'news_cubit.dart';

//абстрактный класс ньювсСтейт - значит этот класс могут только наследовать
//и наследуется скорее всего только @иммутэйбл
@immutable
abstract class NewsState {}

//пустой класс наследующийся от ньювсСтейт
class NewsInitial extends NewsState {}

//класс с 1й переменной (массивом) наследующимся от ньювсСтейт
class NewsLoadedState extends NewsState {
  final List<RssItem> news;

  NewsLoadedState(this.news);
}

//класс с 1й переменной (текстом) наследующимся от ньювсСтейт
class NewsErrorState extends NewsState {
  final String errorMessage;

  NewsErrorState(this.errorMessage);
}