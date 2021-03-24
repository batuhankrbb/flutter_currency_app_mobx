// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurrencyListViewModel on _CurrencyListViewModel, Store {
  final _$currencyFutureAtom =
      Atom(name: '_CurrencyListViewModel.currencyFuture');

  @override
  ObservableFuture<Currency> get currencyFuture {
    _$currencyFutureAtom.reportRead();
    return super.currencyFuture;
  }

  @override
  set currencyFuture(ObservableFuture<Currency> value) {
    _$currencyFutureAtom.reportWrite(value, super.currencyFuture, () {
      super.currencyFuture = value;
    });
  }

  final _$_CurrencyListViewModelActionController =
      ActionController(name: '_CurrencyListViewModel');

  @override
  void getOldCurrencies() {
    final _$actionInfo = _$_CurrencyListViewModelActionController.startAction(
        name: '_CurrencyListViewModel.getOldCurrencies');
    try {
      return super.getOldCurrencies();
    } finally {
      _$_CurrencyListViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getLatestCurrencies() {
    final _$actionInfo = _$_CurrencyListViewModelActionController.startAction(
        name: '_CurrencyListViewModel.getLatestCurrencies');
    try {
      return super.getLatestCurrencies();
    } finally {
      _$_CurrencyListViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currencyFuture: ${currencyFuture}
    ''';
  }
}
