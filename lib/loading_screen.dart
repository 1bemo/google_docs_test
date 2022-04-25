import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  //const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Загрузка вкусной еды...',style: TextStyle(color: Colors.green[900]),),
          const Padding(padding: EdgeInsets.only(top: 20)),
          CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
            strokeWidth: 1,
          ),
        ],
      ),
    );
  }
}
