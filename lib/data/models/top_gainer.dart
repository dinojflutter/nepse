// To parse this JSON data, do
//
//     final topgainerModel = topgainerModelFromJson(jsonString);

import 'dart:convert';

List<TopgainerModel> topgainerModelFromJson(String str) =>
    List<TopgainerModel>.from(
        json.decode(str).map((x) => TopgainerModel.fromJson(x)));

String topgainerModelToJson(List<TopgainerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopgainerModel {
  String symbol;
  double ltp;
  double pointChange;
  double percentageChange;
  String securityName;
  int securityId;

  TopgainerModel({
    required this.symbol,
    required this.ltp,
    required this.pointChange,
    required this.percentageChange,
    required this.securityName,
    required this.securityId,
  });

  factory TopgainerModel.fromJson(Map<String, dynamic> json) => TopgainerModel(
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
