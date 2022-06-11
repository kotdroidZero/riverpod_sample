import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/features/popular_movies/popular_movies_page.dart';
import 'package:riverpod_sample/app/themes.dart';

class RiverPodApplication extends ConsumerWidget {
  const RiverPodApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      // initialRoute: AppRoutes.popularMoviesRoute,
      routes: {
        "/": (context) => const PopularMoviesPage(),
        "/popularMoviesRoute": (context) => const PopularMoviesPage(),
        // AppRoutes.homeRoute: (context) => const HomePage(),
        // AppRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
