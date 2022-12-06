import 'package:crypto_currency/provider/detail_provider.dart';
import 'package:crypto_currency/provider/home_provider.dart';
import 'package:crypto_currency/screens/detal_screen.dart';
import 'package:crypto_currency/screens/profile_screen.dart';
import 'package:crypto_currency/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<HomeProvider>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
            "Crypto Currency",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          actions: [
            PopupMenuButton<int>(
              onSelected: (value) {
                switch(value){
                  case 0 :
                    Get.to(ProfileScreen());
                    break;
                  case 1 :
                    Get.to(SearchScreen());
                }
              },
              itemBuilder:(context) => [
                PopupMenuItem(child: Row(children: [
                  Icon(Icons.account_circle_outlined,),
                  SizedBox(width: 5,),
                  Text("Profile")
                ],),value: 0,),
                PopupMenuItem(child: Row(children: [
                  Icon(Icons.search,),
                  SizedBox(width: 5,),
                  Text("Search")
                ],),value: 1,),
              ],
            )
          ],
        ),
        body: ListView.builder(
            itemCount: prov.coinList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<DetailProvider>(
                        context, listen: false)
                        .getallcoin(prov.coinList[index].id);
                    Get.to(DetailsScreen(id: prov.coinList[index].id));

                  },


                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          Provider
                              .of<HomeProvider>(context)
                              .coinList[index]
                              .market_cap_rank
                              .toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Image.network(
                        prov.coinList[index].imageUrl,
                        width: 25,
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              prov.coinList[index].name,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              prov.coinList[index].symbol,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              prov.coinList[index].current_price
                                  .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              prov.coinList[index].price_change_24h
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: prov.coinList[index]
                                      .price_change_24h > 0
                                      ? Colors.green
                                      : Colors.red
                              ),
                            ),
                            Text(
                              prov.coinList[index]
                                  .price_change_percentage_24h
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: prov.coinList[index]
                                      .price_change_percentage_24h > 0
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                )
              );
            }));
  }
}
