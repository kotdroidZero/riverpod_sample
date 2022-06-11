import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/flavors/build_config.dart';
import 'package:riverpod_sample/flavors/env_config.dart';
import 'package:riverpod_sample/flavors/environment.dart';
import 'package:riverpod_sample/riverpod_app.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Riverpod Sample",
    baseUrl: 'https://api.themoviedb.org/3',
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(
    const ProviderScope(
      child: RiverPodApplication(),
    ),
  );
}
