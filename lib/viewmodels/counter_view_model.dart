import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:random_color/random_color.dart';

part 'counter_view_model.g.dart';

class CounterViewModel = _CounterViewModel with _$CounterViewModel;

abstract class _CounterViewModel with Store {
  @observable
  int counterValue = 0;

  @observable
  Color containerColor = Colors.black;

  List<ReactionDisposer> _disposers;

  @computed
  String get counterFancyText {
    return "Current Value of Counter: $counterValue";
  }

  void setup() {
    _disposers = [
      reaction<int>((_) => counterValue, (newCounterValue) {
        print("New Counter Value = $newCounterValue");
        print("Fetching data from the internet -- Fake");
        containerColor = RandomColor().randomColor();
      })
    ];
  }

  void dispose() {
    _disposers.forEach((element) {
      element();
    });
  }

  @action
  void increaseCounter() {
    counterValue += 1;
  }

  @action
  void superPowerIncreaseCounter() {
    counterValue += 100;
  }
}
