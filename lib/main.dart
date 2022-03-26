import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_docs_test/feedback_list.dart';
import 'controller/form_controller.dart';
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
      home: const MyHomePage(title: 'Flutter Google Sheet Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController someTextController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          ageController.text,
          phoneNoController.text,
          someTextController.text);

      FormController formController = FormController();

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        if (kDebugMode) {
          print("Response: $response");
        }
        if (response == FormController.statusSuccess) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
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
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
              onPressed:_submitForm,
              child: const Text('Submit Feedback',style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeedbackListScreen())
                );
              },
              child: const Text('View Feedback',style: TextStyle(color: Colors.black),)
            )
          ],
        ),
      ),
    );
  }
}