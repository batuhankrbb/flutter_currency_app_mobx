import 'package:flutter_currency_app_mobx/models/currency_model.dart';
import 'package:flutter_currency_app_mobx/services/api_service.dart';
import 'package:flutter_currency_app_mobx/utils/get_it_launch.dart';
import 'package:get_it/get_it.dart';

class CurrencyService {
  Future<Currency> getLatestCurrencies() async {
    ApiService apiService = getIt.get<ApiService>();
    var data = await apiService.get(
        "http://data.fixer.io/api/latest?access_key=c7ec62972465234ba5d37db27ace3cf4&symbols=TRY,USD,AUD,CAD,PLN,MXN&format=1");
    Currency currencyToReturn = Currency.fromJson(data);
    return currencyToReturn;
  }

  Future<Currency> getOldCurrenciesFrom2013() async {
    ApiService apiService = getIt.get<ApiService>();
    var data = await apiService.get(
        "http://data.fixer.io/api/2013-03-16?access_key=c7ec62972465234ba5d37db27ace3cf4&symbols=TRY,USD,AUD,CAD,PLN,MXN&format=1");
    Currency currencyToReturn = Currency.fromJson(data);
    return currencyToReturn;
  }
}
