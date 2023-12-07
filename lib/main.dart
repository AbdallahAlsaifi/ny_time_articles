import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ny_time_articles/src/core/di.dart';
import 'NYMostPopularApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => runApp(DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => const NYMostPopularApp())));
}
