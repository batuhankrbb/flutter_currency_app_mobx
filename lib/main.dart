import 'package:flutter/material.dart';
import 'package:flutter_currency_app_mobx/models/currency_model.dart';
import 'package:flutter_currency_app_mobx/services/currency_service.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:flutter_currency_app_mobx/views/counter_page.dart';
import 'package:flutter_currency_app_mobx/views/currency_list_page.dart';

void main() {
  launchGetIt();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buttonToCurrency(context),
            buttonToCounter(context),
          ],
        ),
      ),
    );
  }

  RaisedButton buttonToCurrency(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CurrencyListPage();
            },
          ),
        );
      },
      color: Colors.purple[300],
      child: Text(
        "CURRENCY",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  RaisedButton buttonToCounter(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CounterPage();
            },
          ),
        );
      },
      color: Colors.teal[300],
      child: Text(
        "COUNTER",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
