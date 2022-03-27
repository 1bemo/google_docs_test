import 'package:flutter/material.dart';
import 'controller/form_controller.dart';
import 'main.dart';

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

    FormController().getFeedbackList().then((foodItemsFromSheet) {
      setState(() {
        foodItems = foodItemsFromSheet;

        for(int i = 0; i<8; i++) {
          foodItems.removeLast();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Food Items'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp())
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, i) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black38,
                ),
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.black12,
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Colors.green[100]
            ),
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: ListTile(
              onTap: (){},
              title: Text(
                foodItems[i].name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                  foodItems[i].composition,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2
              ),
            ),
          );
        }
      ),
    );
  }
}
