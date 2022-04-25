import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_docs_test/rss/src/pages/last_news_page/cubit/news_cubit.dart';
import 'package:google_docs_test/rss/src/utils/utils.dart';

import '../../widgets/image_news_widget.dart';

//все содержимое страницы с новостями
class LastNewsPage extends StatelessWidget {
  const LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //виджет блокПровайдер (подключенный с pub.dev)
    return BlocProvider(
      //в параметре находится ф-я с переменной "_", ктр возвращает объект класса ньювсКубит
      create: (_) => NewsCubit(),
      //в чайлде стейтлесс виджет
      child: const _LastNewsPage(),
    );
  }
}

class _LastNewsPage extends StatelessWidget {
  const _LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //блокБилдер из pub.dev. В нем НьювсКубит, который в create выше
    // и НьювсСтейт - абстрактный класс с @immutable
    return BlocBuilder<NewsCubit, NewsState>(
        //в билдере контекст и стейт, в котором виды НьювсСтейт:
        //NewsInitial, NewsLoadedState или NewsErrorState
        builder: (context, state) {
          //если в стейт НьювсИнитиал, то запустить ф-ю лоадНьювс и вывести круговой индикатор
          if(state is NewsInitial) {
            context.read<NewsCubit>().loadNews();
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
          }

          //если в стейт сласс ньювсЭрорСтейт, то вернуть сообщение ошибки упссс
          if(state is NewsErrorState) {
            return Center(child: Text(
              state.errorMessage,
              style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
            ),);
          }

          //если в стейт лоадедСтейт(загружено), то вернуть виджет РефрешИндикатор
          //в котором лежит листБилдер(ЛистВью.билдер)
          //рефрешИндикатор - если потянуть вниз, то сверху вылезет иконка обновления
          if(state is NewsLoadedState) {
            return Center(
              child: RefreshIndicator(
                //сам ЛистВью.билдер со списком
                child: listBuilder(context,state),
                //событие при обновлении (потянуть вниз)
                onRefresh: () => context.read<NewsCubit>().reloadNews(),
              ),
            );
          }

          //если уж вообще ничего не совпало, то просто вернуть пустой контейнер
          return Container();
        });
  }

  //сам контент листвью.билдер, в ктр прокидывается контекст и стейт (данные загруженные)
  Widget listBuilder(BuildContext context, NewsLoadedState state) {
    return ListView.builder(
      //стейт.ньювс - массив с обектами-новостями
      itemCount: state.news.length,
      itemBuilder: (BuildContext context,int index) {
        //айтем - это наш объект-новость
        final item = state.news[index];
        return ListTile(
          title: Text(
            //заголовок не нулл из объекта
            item.title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          maxLines: 8,
          textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.arrow_right,color: Colors.green[900],),
          contentPadding: const EdgeInsets.all(15),
          //при тапе на ЛистТайл запустиь ф-ю лаунчЮниверсалЛинк с проброшенной в нее ссылкой на новость
          //эта ф-я открывает ссылку в отдельном окне встроенного браузера
          onTap: () => launchUniversalLink(item.link!),
          //энклосур.юрл - ссылка на картинку новости
          //отдельно вынесен виджет с картинкой (кешируемой)
          leading: ImageNewsWidget(urlImage: item.enclosure!.url!,),
        );
      }
    );
  }
}
