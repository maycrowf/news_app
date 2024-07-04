import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'core/service_locator.dart';
import 'package:news/features/news/news.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await ServiceLocator.init();
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