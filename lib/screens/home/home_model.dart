// To parse this JSON data, do
//
//     final marketSummaryModel = marketSummaryModelFromJson(jsonString);

import 'dart:convert';

List<MarketSummaryModel> marketSummaryModelFromJson(String str) =>
    List<MarketSummaryModel>.from(
        json.decode(str).map((x) => MarketSummaryModel.fromJson(x)));

String marketSummaryModelToJson(List<MarketSummaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MarketSummaryModel {
  String? detail;
  double value;

  MarketSummaryModel({
    required this.detail,
    required this.value,
  });

  factory MarketSummaryModel.fromJson(Map<String, dynamic> json) =>
      MarketSummaryModel(
        detail: json["detail"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "value": value,
      };
}
