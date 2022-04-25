import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
//import 'package:advance_notification/advance_notification.dart';  //другой снекбар
import 'package:google_docs_test/category.dart';
import 'package:google_docs_test/rss/src/pages/last_news_page/last_news_page.dart';
import 'package:google_docs_test/theme_data.dart';
//import 'package:ntp/ntp.dart';  //ntp время
import 'package:elegant_notification/elegant_notification.dart';
//import 'package:elegant_notification/resources/arrays.dart';

/*
//дргуие файлы
import 'package:google_docs_test/feedback_list.dart';
import 'controller/form_controller.dart';
import 'food_list.dart';
import 'model/form.dart';
*/

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Sheet Demo',
      theme: greenTheme,
      //пробрасываем в виджет текст, ктр будет использоваться в АппБаре
      home: const MyHomePage(title: 'Тестовый прототип'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title}) : super(key: key);
  //const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /*
  //вкл/выкл кнопки отправки данных
  final bool _isButtonEnable = false;

  //создатся глобальные уникальные ключи для ФормСтейт и СкафолдСтейт
  //формКей дял валидации
  //скафолдКей для снекбара
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  // ТекстЕдитингКонтроллеры для простоты управления текстовыми полями
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController someTextController = TextEditingController();


  // ф-я отправляет данные и сохраняет в гугл таблице
  void _submitForm() {
    // валидация возвращает истину, если форма валидна. Иначе ложь
    if (_formKey.currentState!.validate()) {
      //объект, класса фидбекФорм с заполнением его реквизитов из контроллеров
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          ageController.text,
          phoneNoController.text,
          someTextController.text);

      //объект класса формКонтроллер
      FormController formController = FormController();

      //пишем ,что отправляем
      const AdvanceSnackBar(message: 'Отправка дынных').show(context);

      // отправка и сохранение в гугл таблицу
      formController.submitForm(feedbackForm, (_) {});
    }
  }
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /*Form(
                    key: _formKey,
                    child:
                    Padding(padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: nameController,
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Enter Valid Name';
                            //   }
                            //   return null;
                            // },
                            decoration: const InputDecoration(
                                labelText: 'Name'
                            ),
                          ),
                          TextFormField(
                            controller: ageController,
                            // validator: (value) {
                            //   if (!value!.contains("@")) {
                            //     return 'Enter Valid Email';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: 'Age'
                            ),
                          ),
                          TextFormField(
                            controller: phoneNoController,
                            // validator: (value) {
                            //   if (value!.trim().length != 10) {
                            //     return 'Enter 10 Digit Mobile Number';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                            ),
                          ),
                          TextFormField(
                            controller: someTextController,
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Enter Valid Feedback';
                            //   }
                            //   return null;
                            // },
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                                labelText: 'Some text'
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        _isButtonEnable ? Colors.blue: Colors.black12
                    )
                  ),
                  onPressed: _isButtonEnable ? _submitForm : (){},
                  child: Text(
                    _isButtonEnable ? 'Отправить данные' : 'Отправка отключена',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),*/
                Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      'assets/712_logo.png',
                      width: 150,
                    )),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10,horizontal: 20)),
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Category())
                    );
                  },
                  child: const Text('Загрузить еду',style: TextStyle(color: Colors.white),)
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10,horizontal: 20)),
                        backgroundColor: MaterialStateProperty.all(Colors.green[700])
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scaffold(
                            appBar: AppBar(
                              backgroundColor: Theme.of(context).primaryColor,
                              title: const Text('Новости',style: TextStyle(color: Colors.white),),
                              centerTitle: true,
                              leading: IconButton(
                                icon: const Icon(Icons.arrow_left),
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MyApp())
                                  );
                                },
                              ),
                            ),
                            body: const LastNewsPage(),
                          ))
                      );
                    },
                    child: const Text('RSS Новости Lenta.ru',style: TextStyle(color: Colors.white),)
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10,horizontal: 20)),
                        backgroundColor: MaterialStateProperty.all(Colors.green[500])
                    ),
                    onPressed: (){
                      ElegantNotification(
                        description: Text(
                          'тест уведомления',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        icon: const Icon(Icons.star,color: Colors.green,),
                        shadowColor: Colors.black,
                        radius: 20,
                        animationDuration: const Duration(milliseconds: 300),
                        showProgressIndicator: false,
                        toastDuration: const Duration(seconds: 1),
                        displayCloseButton: false,
                        animation: ANIMATION.fromTop,
                        notificationPosition: NOTIFICATION_POSITION.top,
                      ).show(context);
                    },
                    child: const Text('Акции',style: TextStyle(color: Colors.white),)
                )
              ],
            ),
          ),
    );
  }
}