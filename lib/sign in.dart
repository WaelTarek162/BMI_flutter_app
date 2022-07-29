import 'package:flutter/material.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  String _email = "";
  String _pass = "";

  final _emailController = TextEditingController();
  final _PasslController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _PasslController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
              ),
            ),
            Builder(builder: (ctx) {
              return ElevatedButton(
                child: Text('Sign in'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: ()async {
                  SharedPreferences _data_shared = await SharedPreferences.getInstance();
                  _data_shared.setString("Email", _emailController.text);
                  _data_shared.setString("Pass", _PasslController.text);
                  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_)=>Home()));

                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
