
import 'package:flutter/cupertino.dart';

import '../../Models/Search_Model.dart';
import '../network/coin_api.dart';

class SearchProvider extends ChangeNotifier{
  List<SearchModel> searchlist = [];

  getsearch(String name){
    CoinApi().getsearchdata(name).then((value) {
      searchlist=value.cast<SearchModel>();
      print(searchlist[0].name);
      notifyListeners();
    }).catchError((error){
      print(error);
    });
  }

}