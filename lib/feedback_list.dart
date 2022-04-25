import 'package:flutter/material.dart';
import 'package:google_docs_test/theme_data.dart';
import 'main.dart';

class FeedbackListScreen extends StatelessWidget {
  const FeedbackListScreen({Key? key}) : super(key: key);
  //const FeedbackListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feedback Responses',
        theme: greenTheme,
        home: const FeedbackListPage(title: "Responses"));
  }
}

class FeedbackListPage extends StatefulWidget {
  const FeedbackListPage({Key? key, this.title}) : super(key: key);
  //const FeedbackListPage({Key key, this.title}) : super(key: key);

  final String? title;
  //final String title;

  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  List feedbackItems = [];

  /*@override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
        this.feedbackItems.removeLast();
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp())
            );
          },
        ),
        title: Text(widget.title!),
        //title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: feedbackItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                const Icon(Icons.person),
                Expanded(
                  child: Text(
                      "${feedbackItems[index].name} (${feedbackItems[index].age})"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                const Icon(Icons.message),
                Expanded(
                  child: Text(feedbackItems[index].phone),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}