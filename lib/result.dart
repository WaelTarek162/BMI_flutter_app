import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;
  String get Healthiness{
    String res='';

    if(result<18.5) {
      res='Thin';
    } else if(result>=18.5&&result<25) {
      res='Normal';
    }else if(result>=25&&result<30) {
      res='Overweight';
    }else if(result>=30) {
      res='Obese';
    }

    return res;
  }

  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 15,leading: Icon(Icons.person),title: Text('Result',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),centerTitle: true,),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Gender: ${isMale ? 'Male' : 'Female'}',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Result: ${result.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Age: ${age}',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Healthiness: $Healthiness',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      );
  }
}
