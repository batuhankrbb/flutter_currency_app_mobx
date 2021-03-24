// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterViewModel on _CounterViewModel, Store {
  Computed<String> _$counterFancyTextComputed;

  @override
  String get counterFancyText => (_$counterFancyTextComputed ??=
          Computed<String>(() => super.counterFancyText,
              name: '_CounterViewModel.counterFancyText'))
      .value;

  final _$counterValueAtom = Atom(name: '_CounterViewModel.counterValue');

  @override
  int get counterValue {
    _$counterValueAtom.reportRead();
    return super.counterValue;
  }

  @override
  set counterValue(int value) {
    _$counterValueAtom.reportWrite(value, super.counterValue, () {
      super.counterValue = value;
    });
  }

  final _$containerColorAtom = Atom(name: '_CounterViewModel.containerColor');

  @override
  Color get containerColor {
    _$containerColorAtom.reportRead();
    return super.containerColor;
  }

  @override
  set containerColor(Color value) {
    _$containerColorAtom.reportWrite(value, super.containerColor, () {
      super.containerColor = value;
    });
  }

  final _$_CounterViewModelActionController =
      ActionController(name: '_CounterViewModel');

  @override
  void increaseCounter() {
    final _$actionInfo = _$_CounterViewModelActionController.startAction(
        name: '_CounterViewModel.increaseCounter');
    try {
      return super.increaseCounter();
    } finally {
      _$_CounterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void superPowerIncreaseCounter() {
    final _$actionInfo = _$_CounterViewModelActionController.startAction(
        name: '_CounterViewModel.superPowerIncreaseCounter');
    try {
      return super.superPowerIncreaseCounter();
    } finally {
      _$_CounterViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counterValue: ${counterValue},
containerColor: ${containerColor},
counterFancyText: ${counterFancyText}
    ''';
  }
}
