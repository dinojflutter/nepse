// To parse this JSON data, do
//
//     final topLoserModel = topLoserModelFromJson(jsonString);

import 'dart:convert';

List<TopLoserModel> topLoserModelFromJson(String str) =>
    List<TopLoserModel>.from(
        json.decode(str).map((x) => TopLoserModel.fromJson(x)));

String topLoserModelToJson(List<TopLoserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopLoserModel {
  String symbol;
  double ltp;
  double pointChange;
  double percentageChange;
  String securityName;
  int securityId;

  TopLoserModel({
    required this.symbol,
    required this.ltp,
    required this.pointChange,
    required this.percentageChange,
    required this.securityName,
    required this.securityId,
  });

  factory TopLoserModel.fromJson(Map<String, dynamic> json) => TopLoserModel(
        symbol: json["symbol"],
        ltp: json["ltp"]?.toDouble(),
        pointChange: json["pointChange"]?.toDouble(),
        percentageChange: json["percentageChange"]?.toDouble(),
        securityName: json["securityName"],
        securityId: json["securityId"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "ltp": ltp,
        "pointChange": pointChange,
        "percentageChange": percentageChange,
        "securityName": securityName,
        "securityId": securityId,
      };
}
