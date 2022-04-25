import 'package:flutter/material.dart';
import 'package:google_docs_test/loading_screen.dart';
import 'package:google_docs_test/theme_data.dart';

import 'food_controller.dart';
import 'food_list.dart';
import 'main.dart';

String nameFoodList = 'Ветчины';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);
  //const Category({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: greenTheme,
      home: const CategoryList(),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);
  //const CategoryList({Key key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  List category = [];

  @override
  void initState() {
    super.initState();

    FoodController().getCategoryList().then((categoryListFromJson) {
      setState(() {
        category = categoryListFromJson;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp())
            );
          },
        ),
        title: const Text('Категории'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Scrollbar(
        child: category.isEmpty ? const LoadingScreen() :
        ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, i) {
            return TextButton(
              style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  //цвет сплеша по кнопке
                  overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.7))
              ),
              onPressed: (){
                nameFoodList = category[i];
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodListScreen())
                );
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    //color: Colors.white,
                    gradient: const LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xffeaffdb),
                        //Colors.white,
                      ]
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0,5)
                      ),
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: i>=imagesCategory.length
                                ? Image.asset('lib/assets/meat_placeholder.png',height: 25,color: Colors.green[900],)
                                : Image.asset(imagesCategory[i],height: 25,color: Colors.green[900],)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            category[i],
                            style: TextStyle(
                                color: Colors.green[900],
                                fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_right_outlined,color: Theme.of(context).primaryColor,)
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

