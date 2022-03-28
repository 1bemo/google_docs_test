import 'package:flutter/material.dart';
import 'package:advance_notification/advance_notification.dart';  //другой снекбар

//дргуие файлы
import 'package:google_docs_test/feedback_list.dart';
import 'controller/form_controller.dart';
import 'food_list.dart';
import 'model/form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //пробрасываем в виджет текст, ктр будет использоваться в АппБаре
      home: const MyHomePage(title: 'Flutter Google Sheet Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title}) : super(key: key);

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodListScreen())
                );
              },
              child: const Text('Загрузить данные',style: TextStyle(color: Colors.black),)
            )
          ],
        ),
      ),
    );
  }
}