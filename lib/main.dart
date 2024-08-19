import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/data/data_source/repositories/market_repo.dart';
import 'package:nepse/data/data_source/repositories/repo.dart';
import 'package:nepse/screens/home/home_import.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repo(
      marketrepo: MarketRepo(),
    ),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
