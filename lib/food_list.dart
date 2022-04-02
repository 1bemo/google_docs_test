import 'package:flutter/material.dart';
import 'package:google_docs_test/category.dart';
import 'package:google_docs_test/food_controller.dart';

// ignore: must_be_immutable
class FoodListScreen extends StatelessWidget {
  const FoodListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[700],
      ),
      home: const FoodListPage(),
    );
  }
}

// ignore: must_be_immutable
class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {

  //пустой список
  List foodItems = [];

  @override
  void initState() {
    super.initState();

    FoodController().getFoodList().then((foodItemsFromSheet) {
      setState(() {
        foodItems = foodItemsFromSheet;
        foodItems = formatImageLink(foodItems);
      });
    });
  }

  List formatImageLink (List fdItem) {
    fdItem[23].image = fdItem[23].image.toString().replaceAll('=IMAGE("', '');
    fdItem[23].image = fdItem[23].image.toString().replaceAll('")', '');
    return fdItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('some'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Category())
            );
          },
        ),
      ),
      body: Scrollbar(
        radius: const Radius.circular(5),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0,5)
                  )
                ]
              ),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.3))
                ),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Подробно $i',
                          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Наименование:',style: TextStyle(fontSize: 10),),
                              Text(foodItems[i].name.trim(),style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.bold,fontSize: 16),),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  foodItems[i].image == ''
                                      ? Image.asset('lib/assets/no_image.png',width: 150,)
                                      : Image.network(foodItems[i].image, width: 150,),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              const Text('Состав:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].composition.trim(),style: const TextStyle(fontSize: 10)),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              const Text('Ед.изм:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].unit.trim(),style: const TextStyle(fontSize: 10)),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              const Text('Условия хранения:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].temperature.trim(),style: const TextStyle(fontSize: 10)),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              const Text('Срок годности:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].spoiled.trim(),style: const TextStyle(fontSize: 10)),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              const Text('Пищевая ценность:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].nutritional.trim(),style: const TextStyle(fontSize: 10)),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              const Text('Энергетическая ценность:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].energy.trim(),style: const TextStyle(fontSize: 10)),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              const Text('Нормативный документ:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].normativeDocument.trim(),style: const TextStyle(fontSize: 10)),
                              const Padding(padding: EdgeInsets.only(top: 5)),
                              const Text('Декларация:',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text(foodItems[i].declarate.trim(),style: const TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('Закрыть',style: TextStyle(color: Colors.green[900]),)
                          )
                        ],
                      )
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            foodItems[i].name.trim(),
                            style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 14
                            ),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_right_sharp,color: Colors.black,)
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      children: [
                        const Text(
                          'Условия хранения:',
                          style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.normal)),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          foodItems[i].temperature.trim(),
                          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 10),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                            'Срок годности:',
                            style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.normal)),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          foodItems[i].spoiled.trim(),
                          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 10),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const Text(
                      'Состав:',
                      style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.normal)
                    ),
                    Text(
                      foodItems[i].composition.trim(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.normal)
                    ),
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
