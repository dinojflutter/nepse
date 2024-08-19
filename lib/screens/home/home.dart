part of 'home_import.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late HomeViewModel homeViewModel;
  @override
  void initState() {
    homeViewModel = HomeViewModel(repo: context.read<Repo>());
    homeViewModel.getsummarydata();
    homeViewModel.getgainerdata();
    homeViewModel.getlosedata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hamro Nepse",
          style: TextStyle(
              color: Colors.orange, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const Center(
            child: Text(
              "Top Gainer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.black),
            child: BlocBuilder<VelocityBloc<List<TopgainerModel>>,
                VelocityState<List<TopgainerModel>>>(
              bloc: homeViewModel.gainerbloc,
              builder: (context, state) {
                if (state is VelocityInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is VelocityUpdateState) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final item = state.data[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.symbol.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  item.pointChange.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                                const Spacer(),
                                Text(
                                  item.percentageChange.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                                const Spacer(),
                                Text(
                                  item.ltp.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          const Center(
            child: Text(
              "Top Loser",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.black),
            child: BlocBuilder<VelocityBloc<List<TopLoserModel>>,
                VelocityState<List<TopLoserModel>>>(
              bloc: homeViewModel.loserbloc,
              builder: (context, state) {
                if (state is VelocityInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is VelocityUpdateState) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final item = state.data[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.symbol.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Text(
                                  item.pointChange.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                                Text(
                                  item.percentageChange.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                                Text(
                                  item.ltp.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.orange),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          const Center(
            child: Text(
              "Market Summary",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.black),
            child: BlocBuilder<VelocityBloc<List<MarketSummaryModel>>,
                VelocityState<List<MarketSummaryModel>>>(
              bloc: homeViewModel.marketbloc,
              builder: (context, state) {
                if (state is VelocityInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is VelocityUpdateState) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final item = state.data[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    item.detail.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                  ),
                                ),
                                Text(
                                  item.value.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
