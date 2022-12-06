import 'package:crypto_currency/models/home_model.dart';
import 'package:crypto_currency/network/coin_api.dart';
import 'package:crypto_currency/network/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProvider extends ChangeNotifier {
  List<HomeModel> coinList = [];



  HomeProvider() {
    getAllCoin();
  }
getAllCoin() async{
    try{
await CoinApi().getdata().then((value){
coinList=value;
print(value);
notifyListeners();
}
);
  }on DioError catch(e){
      String error =DioExceptions.fromDioError(e).toString();
print(error);

Get.dialog(
  AlertDialog(
    title: Text("Error"),
content: Text(error),
    actions: [TextButton( onPressed:(){
      Get.back();
    },child:Text("ok"))
    ],
  )
);
    }
      }


}