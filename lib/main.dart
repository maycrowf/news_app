import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:news/core/core.dart';
import 'package:news/core/storage/local_storage.dart';
import 'package:news/core/storage/local_storage_impl.dart';
import 'package:news/data/datasources/remote/news/news_remote_datasource.dart';
import 'package:news/data/datasources/remote/news/news_remote_datasource_impl.dart';
import 'package:news/repositories/news/news.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news/features/news/news.dart';
import 'package:get_it/get_it.dart';

part 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjector();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    runApp(const NewsApp());
  });
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const NewsScreen(),
    );
  }
}
