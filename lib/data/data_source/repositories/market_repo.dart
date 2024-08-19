import 'package:nepse/data/data_source/remote/api_client.dart';
import 'package:nepse/data/data_source/remote/api_endpoint_url.dart';
import 'package:nepse/data/models/top_gainer.dart';
import 'package:nepse/screens/home/home_model.dart';

import '../../models/top_loser.dart';

class MarketRepo extends ApiClient {
  Future<List<MarketSummaryModel>> marketdata() async {
    try {
      final response = await getRequest(path: ApiEndpointUrl.marketsummary);
      if (response.statusCode == 200) {
        // No need for jsonEncode; just decode the response data
        final responseData = marketSummaryModelFromJson(response.data);
        return responseData;
      } else {
        throw Exception("No data found");
      }
    } on Exception catch (e) {
      // Handle the exception
      throw Exception(e.toString());
    }
  }

  Future<List<TopLoserModel>> getloserdata() async {
    try {
      final response = await getRequest(path: ApiEndpointUrl.toplosser);
      if (response.statusCode == 200) {
        // No need for jsonEncode; just decode the response data
        final responseData = topLoserModelFromJson(response.data);
        return responseData;
      } else {
        throw Exception("No data found");
      }
    } on Exception catch (e) {
      // Handle the exception
      throw Exception(e.toString());
    }
  }

  Future<List<TopgainerModel>> getprofitdata() async {
    try {
      final response = await getRequest(path: ApiEndpointUrl.topgainer);
      if (response.statusCode == 200) {
        // No need for jsonEncode; just decode the response data
        final responseData = topgainerModelFromJson(response.data);
        return responseData;
      } else {
        throw Exception("No data found");
      }
    } on Exception catch (e) {
      // Handle the exception
      throw Exception(e.toString());
    }
  }
}
