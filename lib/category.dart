import 'package:flutter/material.dart';

import 'food_controller.dart';
import 'food_list.dart';
import 'main.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.green.withOpacity(0.7),
        primaryColor: Colors.green[700],
        highlightColor: Colors.green[900],
        //цвет подсказки конца списка
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
      ),
      home: const CategoryList(),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

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
        child: ListView.builder(
          itemCount: category.length,
          itemBuilder: (context, i) {
            return TextButton(
              style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  //цвет сплеша по кнопке
                  overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.7))
              ),
              onPressed: (){
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
                    color: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        category[i],
                        style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 16
                        ),
                      ),
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

