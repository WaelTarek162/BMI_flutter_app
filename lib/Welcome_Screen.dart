import 'package:flutter/material.dart';
import 'sign in.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({Key? key}) : super(key: key);

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  bool check_acceptance = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          ),
          body: Column(

            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Checkbox(
                    value: check_acceptance,
                    onChanged: (c) {
                      setState(() {
                        check_acceptance = c!;
                      });
                    }
                ),
                ElevatedButton(onPressed: () {
                  if (check_acceptance == true) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Home()));
                  } else {
                    AlertDialog(
                      title: Text("Alert"),
                      content: Text("You must accept on our rules"),

                    );
                  }
                }, child: Text('Get Start')),
              ]
          ),)
    );
  }
}