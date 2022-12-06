
import 'package:dio/dio.dart';

import '../Models/Search_Model.dart';
import '../models/detail_model.dart';
import '../models/home_model.dart';

class CoinApi{
  Future<List<HomeModel>> getdata() async{
    final response = await Dio().get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');

    return List<HomeModel>.from(response.data.map((e)=>HomeModel.fromjson(e)));
  }
  Future<DetailModel>   getDetail(String id) async{
    final response = await Dio().get('https://api.coingecko.com/api/v3/coins/$id');

    return DetailModel.fromjson(response.data!);
  }
  Future<List<SearchModel>> getsearchdata(String name)async{
    final response = await Dio().get('https://api.coingecko.com/api/v3/search?query=$name');

    return List<SearchModel>.from(response.data['coins'].map((e)=>SearchModel.fromjson(e)));
  }

}