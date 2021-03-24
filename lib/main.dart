import 'package:flutter/material.dart';
import 'package:flutter_currency_app_mobx/models/currency_model.dart';
import 'package:flutter_currency_app_mobx/services/currency_service.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:flutter_currency_app_mobx/views/currency_list_page.dart';

void main() {
  launchGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyListPage(),
    );
  }
}
