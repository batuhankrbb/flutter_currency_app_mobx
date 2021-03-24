import 'package:flutter/material.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:flutter_currency_app_mobx/viewmodels/currency_list_view_model.dart';

class CurrencyListDummyPage extends StatelessWidget {
  CurrencyListViewModel _currencyListViewModel =
      getIt.get<CurrencyListViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("LETS TEST THE VIEWMODEL"),
          RaisedButton(
            onPressed: () {
              _currencyListViewModel.getOldCurrencies();
            },
            color: Colors.teal,
            child: Text("Press for the currency from 2013"),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("For Testing"),
    );
  }
}
