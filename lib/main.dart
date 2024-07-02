import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:news/news_app.dart';

import 'core/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await ServiceLocator.init();
    runApp(const NewsApp());
  });
}
