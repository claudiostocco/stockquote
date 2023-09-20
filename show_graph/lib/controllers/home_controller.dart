import 'package:flutter/material.dart';

import 'package:show_graph/api/api.dart';
import 'package:show_graph/constants/global.dart';
import 'package:show_graph/types/monitored_tickers.dart';

class HomeController extends ChangeNotifier {
  List<MonitoredTickers> _tickersList = [];
  bool _isLoading = false;

  List<MonitoredTickers> get tickersList => _tickersList;
  bool get isLoading => _isLoading;

  Future<void> getTickers() async {
    _isLoading = true;
    notifyListeners();
    var response = await (await Api().initInstance())
        .unAuth()
        .get('$kFirebaseUrl/tickers.json');

    print('response.statusCode: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body);
      _tickersList = MonitoredTickers.list(response.body);
    }
    _isLoading = false;
    notifyListeners();
  }
}
