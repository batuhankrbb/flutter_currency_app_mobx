import 'package:flutter_currency_app_mobx/services/api_service.dart';
import 'package:flutter_currency_app_mobx/services/currency_service.dart';
import 'package:flutter_currency_app_mobx/viewmodels/counter_view_model.dart';
import 'package:flutter_currency_app_mobx/viewmodels/currency_list_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void launchGetIt() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => CurrencyService());
  getIt.registerLazySingleton(() => CurrencyListViewModel());
  getIt.registerLazySingleton(() => CounterViewModel());
}
