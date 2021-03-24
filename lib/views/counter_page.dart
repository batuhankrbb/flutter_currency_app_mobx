import 'package:flutter/material.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:flutter_currency_app_mobx/viewmodels/counter_view_model.dart';
import 'package:flutter_currency_app_mobx/views/counter_super_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterViewModel _counterViewModel = getIt.get<CounterViewModel>();

  @override
  void initState() {
    super.initState();
    _counterViewModel.setup();
    print("Init CounterPage Worked");
  }

  @override
  void dispose() {
    super.dispose();
    _counterViewModel.dispose();
    print("Dispose CounterPage Worked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: buildFloatingActionButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          pageTitle(),
          SizedBox(
            height: 40,
          ),
          Observer(builder: (_) {
            return Text(
              _counterViewModel.counterFancyText,
              style: TextStyle(fontSize: 20),
            );
          }),
          SizedBox(
            height: 400,
            width: 200,
            child: Observer(
              builder: (_) => ListView.builder(
                itemBuilder: (counter, index) {
                  return Text("${_counterViewModel.oldValuesList[index]}  ");
                },
                itemCount: _counterViewModel.oldValuesList.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          )
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        _counterViewModel.increaseCounter();
      },
    );
  }

  Center pageTitle() {
    return Center(
      child: Text(
        "Counter Page",
        style: TextStyle(fontSize: 35),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Counter Example"),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CounterSuperPage();
                },
              ),
            );
          },
          child: Text(
            "SUPER PAGE",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
