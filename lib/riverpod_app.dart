import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/approutes.dart';
import 'package:riverpod_sample/app/features/dashboard/page/dashboard_page.dart';
import 'package:riverpod_sample/app/features/movies/popular_movies/page/popular_movies_page.dart';
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
        "/": (context) => const DashboardPage(),
        AppRoutes.popularMoviesRoute: (context) => const PopularMoviesPage(),
        // AppRoutes.homeRoute: (context) => const HomePage(),
        // AppRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
