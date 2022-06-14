import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/core/values/app_strings.dart';

import 'package:riverpod_sample/app/core/widget/custom_loader.dart';
import 'package:riverpod_sample/app/features/movies/popular_movies/widget/movie_item.dart';
import 'package:riverpod_sample/app/features/movies/popular_movies/provider/popular_movies_provider.dart';
import 'package:riverpod_sample/data/models/responses/popular_movies.dart';

class PopularMoviesPage extends ConsumerWidget {
  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncMoviesList = ref.watch(getPopularMovies);
    return Scaffold(
      body: asyncMoviesList.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.read(getPopularMovies);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  movieList(data.results ?? []),
                ],
              ),
            ),
          );
        },
        error: (e, t) {
          return Center(
            child: Text('Error ${e.toString()}'),
          );
        },
        loading: () => const CustomLoader(),
      ),
    );
  }

  sortingWidget() {
    return const SizedBox(
      child: ExpansionTile(
        title: Text(AppStrings.sort),
      ),
    );
  }

  filterWidget() {
    return const SizedBox(
      child: ExpansionTile(
        title: Text(AppStrings.filter),
      ),
    );
  }

  whereToWatchWidget() {
    return const SizedBox(
      child: ExpansionTile(
        title: Text(AppStrings.whereToWatch),
      ),
    );
  }

  movieList(List<Result> movies) {
    return GridView.extent(
      shrinkWrap: true,
      primary: false,
      // padding: const EdgeInsets.all(16),
      crossAxisSpacing: 10,
      mainAxisSpacing: 5,
      maxCrossAxisExtent: 200.0,
      childAspectRatio: 3.5 / 7,
      children: movies.map((e) => PopularMovieItem(movie: e)).toList(),
    );
  }
}
