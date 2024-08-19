part of 'home_import.dart';

class HomeViewModel {
  final Repo repo;

  HomeViewModel({required this.repo});

  final VelocityBloc<List<MarketSummaryModel>> marketbloc =
      VelocityBloc<List<MarketSummaryModel>>([]);
  final VelocityBloc<List<TopLoserModel>> loserbloc =
      VelocityBloc<List<TopLoserModel>>([]);

  final VelocityBloc<List<TopgainerModel>> gainerbloc =
      VelocityBloc<List<TopgainerModel>>([]);

  getsummarydata() async {
    var data = await repo.marketrepo.marketdata();
    if (data.isNotEmpty) {
      marketbloc.onUpdateData(data);
    }
  }

  //get Top 10 loserdata

  getlosedata() async {
    var data = await repo.marketrepo.getloserdata();
    if (data.isNotEmpty) {
      loserbloc.onUpdateData(data);
    }
  }

  //gainer data
  getgainerdata() async {
    var data = await repo.marketrepo.getprofitdata();
    if (data.isNotEmpty) {
      gainerbloc.onUpdateData(data);
    }
  }
}
