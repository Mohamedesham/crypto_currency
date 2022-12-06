class SearchModel {
  final String id;
  final String name;
  final String api_symbol;
  final String symbol;
  final String imageUrl;
  final int rank;

  SearchModel(
      {required this.id,
      required this.name,
      required this.api_symbol,
      required this.symbol,
      required this.imageUrl,
      required this.rank});

  factory SearchModel.fromjson(Map<String, dynamic> json) {
    return SearchModel(
        id: json["id"],
        name: json["name"],
        api_symbol: json["api_symbol"],
        symbol: json["symbol"],
        imageUrl: json["large"],
        rank: json["market_cap_rank"]);
  }
}
