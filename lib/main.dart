import 'package:flutter/material.dart';
import 'package:loginwithrestapi/loginfailed.dart';
import 'package:loginwithrestapi/loginsuccess.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: username,
                decoration: InputDecoration(hintText: 'username'),
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(hintText: 'password'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    login();
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    var url = Uri.parse('https://reqres.in/api/login');
    var response = await http
        .post(url, body: {"email": username.text, "password": password.text});
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Logout()));
    } else {
      print(response.statusCode);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Failed()));
    }
  }
}
