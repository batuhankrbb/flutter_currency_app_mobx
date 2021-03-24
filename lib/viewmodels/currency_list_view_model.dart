import 'package:flutter_currency_app_mobx/services/currency_service.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_currency_app_mobx/models/currency_model.dart';

part 'currency_list_view_model.g.dart';

class CurrencyListViewModel = _CurrencyListViewModel
    with _$CurrencyListViewModel;

abstract class _CurrencyListViewModel with Store {
  CurrencyService _currencyService = getIt.get<CurrencyService>();

  @observable
  ObservableFuture<Currency> currencyFuture;

  @action
  void getOldCurrencies() {
    currencyFuture =
        ObservableFuture(_currencyService.getOldCurrenciesFrom2013());
  }

  @action
  void getLatestCurrencies() {
    currencyFuture = ObservableFuture(_currencyService.getLatestCurrencies());
  }
}
