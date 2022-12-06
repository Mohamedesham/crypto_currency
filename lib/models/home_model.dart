class HomeModel {
  final String id;
  final String symbol;
  final String imageUrl;
  final String name;
  final double current_price;
  final int market_cap_rank;
  final double price_change;
  final double price_change_24h;
  final double price_change_percentage_24h;

  HomeModel({
    required this.id,
    required this.symbol,
    required this.imageUrl,
    required this.current_price,
    required this.market_cap_rank,
    required this.price_change,
    required this.price_change_24h,
    required this.price_change_percentage_24h, required this.name});

  factory HomeModel.fromjson(Map<String, dynamic>json){
    return HomeModel(id: json ["id"],
        symbol: json ["symbol"],
        imageUrl: json ["image"],
        name: json["name"],
        current_price: json ["current_price"],
        market_cap_rank: json ["market_cap_rank"],
        price_change: json["current_price"],
        price_change_24h: json["price_change_24h"],
        price_change_percentage_24h: json["price_change_percentage_24h"]);
  }
}