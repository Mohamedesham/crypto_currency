import 'package:crypto_currency/models/detail_model.dart';
import 'package:flutter/material.dart';

import '../Network/coin_api.dart';

class DetailProvider extends ChangeNotifier {
  DetailModel coinlist = DetailModel(rank: 0,
      name: "",
      symbol: "",
      current_price: 0,
      image: "",
      percentchange_24h: 0,
      percentchange_7d: 0,
      per_ch_14: 0,
      per_ch_30: 0,
      per_ch_60: 0,
      per_ch_200: 0,
      per_ch_1y: 0,
      description: "");


  getallcoin(String id) async {
    CoinApi().getDetail(id).then((value) {
      coinlist = value;
      notifyListeners();
    });
  }
}
