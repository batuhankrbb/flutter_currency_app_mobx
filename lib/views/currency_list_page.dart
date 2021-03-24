import 'package:flutter/material.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:flutter_currency_app_mobx/viewmodels/currency_list_view_model.dart';
import 'package:flutter_currency_app_mobx/views/currency_list_dummy_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CurrencyListPage extends StatelessWidget {
  CurrencyListViewModel _currencyListViewModel =
      getIt.get<CurrencyListViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          dummyTitle(),
          Container(
            width: 400,
            height: 500,
            padding: EdgeInsets.all(12),
            alignment: Alignment.topCenter,
            child: buildObserverCurrencyWidget(),
          ),
          latestCurrencyButton(),
        ],
      ),
    );
  }

  Observer buildObserverCurrencyWidget() {
    return Observer(builder: (_) {
      if (_currencyListViewModel.currencyFuture == null) {
        return buildInitialText();
      }
      return widgetByStatus();
    });
  }

  Widget currencyDetails() {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child:
              Text("BASE: ${_currencyListViewModel.currencyFuture.value.base}"),
        ),
        Expanded(
          flex: 10,
          child:
              Text("DATE: ${_currencyListViewModel.currencyFuture.value.date}"),
        ),
        Expanded(
          flex: 10,
          child: Text(
              "HISTORICAL: ${_currencyListViewModel.currencyFuture.value.historical}"),
        ),
        Expanded(
          flex: 70,
          child: ListView.builder(
            itemBuilder: (context, index) {
              var currentRate =
                  _currencyListViewModel.currencyFuture.value.rates[index];
              return ListTile(
                title: Text(currentRate.name),
                subtitle: Text("${currentRate.price}"),
                trailing: Icon(Icons.money),
              );
            },
            itemCount: _currencyListViewModel.currencyFuture.value.rates.length,
          ),
        ),
      ],
    );
  }

  Widget widgetByStatus() {
    switch (_currencyListViewModel.currencyFuture.status) {
      case FutureStatus.rejected:
        return rejectedText();
      case FutureStatus.pending:
        return buildCircularProgressIndicator();
      case FutureStatus.fulfilled:
        return currencyDetails();
      default:
        return defaultText();
    }
  }

  RaisedButton latestCurrencyButton() {
    return RaisedButton(
      onPressed: () {
        _currencyListViewModel.getLatestCurrencies();
      },
      child: Text(
        "Press for the latest currency",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );
  }

  Text buildInitialText() {
    return Text(
      "Hey! Press the button",
      style: TextStyle(fontSize: 30, color: Colors.grey),
    );
  }

  Text rejectedText() {
    return Text(
      "REJECTED",
      style: TextStyle(color: Colors.red, fontSize: 30),
    );
  }

  CircularProgressIndicator buildCircularProgressIndicator() =>
      CircularProgressIndicator();

  Text defaultText() => Text("INITIAL");

  Center dummyTitle() {
    return Center(
      child: Text(
        "MobX App",
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Currency List!"),
      centerTitle: true,
      actions: [buildFlatButton(context)],
    );
  }

  FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return CurrencyListDummyPage();
            },
          ),
        );
      },
      child: Text(
        "OTHER PAGE",
      ),
      textColor: Colors.white,
    );
  }
}
