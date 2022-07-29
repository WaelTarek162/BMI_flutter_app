import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

Future<Object> assertion() async {
  SharedPreferences _data_shared = await SharedPreferences.getInstance();
  var email = _data_shared.get("Email");
  var pass = _data_shared.get("Pass");

  if (email == "wael@gmail.com" && pass == "01221787510") {
    return Home();
  }
  return false;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = false;
  int age = 22;
  double hight = 188.0;
  double wight = 82.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Body Mass Index'), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Gender_widget(context, true),
                    const SizedBox(
                      width: 15,
                    ),
                    Gender_widget(context, false),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  color: Colors.blueGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hieght',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [

                          Text(hight.toStringAsFixed(1),style: Theme.of(context).textTheme.headline1,),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Slider(
                        value: hight,
                        activeColor: Colors.teal,
                        inactiveColor: Colors.blueGrey,
                        onChanged: (val) {
                          setState(() {
                            hight = val;
                          });
                        },
                        min: 45.0,
                        max: 225.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Custom_widget(context, 'Weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    Custom_widget(context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.headline2,
                ),
                onPressed: () {
                  var result;
                  result = wight / pow((hight / 100), 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              isMale: isMale, age: age, result: result)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded Gender_widget(BuildContext context, bool IsMale) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (IsMale ? true : false);
            print("Is male? ${isMale}");
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && IsMale) || (isMale == false && IsMale == false)
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(IsMale ? Icons.male : Icons.female),
              SizedBox(
                height: 15,
              ),
              Text(
                IsMale ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  /// for gender selection widget
  Expanded Custom_widget(BuildContext context, String str) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              str,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              str == 'Age' ? '$age' : '${wight.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.headline1,
            ),

            str == 'Age'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () => setState(() => age--),
                        child: const Icon(Icons.remove),
                        mini: true,
                      ),
                      const SizedBox(width: 80),
                      FloatingActionButton(
                        onPressed: () => setState(() => age++),
                        child: const Icon(Icons.add),
                        mini: true,
                      ),
                    ],
                  )
                : Slider(
              value: wight,
              activeColor: Colors.teal,
              inactiveColor: Colors.blueGrey,
              onChanged: (val) {
                setState(() {
                  wight = val;
                });
              },
              min: 1.0,
              max: 200.0,
            ) //Slider(value: wight, onChanged: null),
          ],
        ),
      ),
    );
  }

  /// for assign age and wieght
}
