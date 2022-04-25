import 'package:cached_network_image/cached_network_image.dart';  //кешируемая картинка с возможностью заглушки
import 'package:flutter/material.dart';

class ImageNewsWidget extends StatelessWidget {
  //стейтлесс виджет с 3мя изначальными переменными(ссылка,высота,ширина)
  //где ширина и высота задаются по умолчанию 50 и 80
  const ImageNewsWidget({Key? key, required this.urlImage, this.height = 50, this.width = 80}) : super(key: key);

  final String urlImage;
  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    //возвращаем отступ с чайлдом КетчедНетворкАймейдж из pub.dev
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CachedNetworkImage(
        //затычка, пока не загружена картинка
        placeholder: (context, url) => Image.asset('lib/assets/no_image_rss.PNG'),
        //ссылка на картинку
        imageUrl: urlImage,
        //высота, ширина
        height: height,
        width: width,
        //выравнивание
        alignment: Alignment.center,
        //метод заполнения
        fit: BoxFit.fill,
      ),
    );
  }
}
