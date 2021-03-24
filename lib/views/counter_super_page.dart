import 'package:flutter/material.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:flutter_currency_app_mobx/viewmodels/counter_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterSuperPage extends StatelessWidget {
  CounterViewModel _counterViewModel = getIt.get<CounterViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          children: [
            Observer(
              builder: (_) => Text(
                "${_counterViewModel.counterValue}",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            increaseButton(),
            SizedBox(
              height: 50,
            ),
            Observer(
              builder: (_) => Container(
                height: 130,
                width: 130,
                color: _counterViewModel.containerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget increaseButton() {
    return RaisedButton(
      onPressed: () {
        _counterViewModel.superPowerIncreaseCounter();
      },
      color: Colors.pink[400],
      child: Text(
        "SUPER INCREASE",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Super Page"),
      centerTitle: true,
    );
  }
}
