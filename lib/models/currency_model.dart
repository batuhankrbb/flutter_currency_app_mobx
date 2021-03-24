import 'package:flutter/cupertino.dart';

class Currency {
  Currency({
    this.success,
    this.timestamp,
    this.historical,
    this.base,
    this.date,
    this.rates,
  });

  bool success;
  int timestamp;
  bool historical;
  String base;
  DateTime date;
  List<Rate> rates;

  factory Currency.fromJson(Map<String, dynamic> json) {
    //pretty messy but it works fn
    List<Rate> rateList = [];

    var rates = Map<String, double>.from(json["rates"]);
    rates.forEach((key, value) {
      rateList.add(Rate(name: key, price: value));
    });

    return Currency(
      success: json["success"],
      timestamp: json["timestamp"],
      historical: json["historical"] ?? false,
      base: json["base"],
      date: DateTime.parse(json["date"]),
      rates: rateList,
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "timestamp": timestamp,
        "historical": historical,
        "base": base,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "rates": "WE WILL NEVER NEED TO CONVERT IT TO A JSON OBJECT :)",
      };

  @override
  String toString() {
    var ratesText = List.from(rates.map((e) => "${e.name}: ${e.price}"));
    return 'Currency{success: $success, timestamp: $timestamp, historical: $historical, base: $base, date: $date, rates: $ratesText}';
  }
}

class Rate {
  String name;
  double price;

  Rate({@required this.name, @required this.price});
}
