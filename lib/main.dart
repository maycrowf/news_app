import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:news/core/core.dart';
import 'package:news/core/storage/local_storage.dart';
import 'package:news/core/storage/local_storage_impl.dart';
import 'package:news/data/datasources/export_datasources.dart';
import 'package:news/data/repositories/export_repository_impls.dart';
import 'package:news/domain/usecases/export_usecases.dart';
import 'package:news/domain/repositories/export_repositories.dart';
import 'package:news/presentation/view/news_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        scaffoldBackgroundColor: Colors.grey[300],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const NewsScreen(),
    );
  }
}
