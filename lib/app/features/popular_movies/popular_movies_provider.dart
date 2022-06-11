import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/network/repository/popular_movie/popular_movies_repo_impl.dart';
import 'package:riverpod_sample/data/models/responses/popular_movies.dart';

///Author-Pushkar Srivastava
///Date-11/06/22

final getPopularMovies = FutureProvider<PopularMovies>((ref) {
  return ref.watch(popularMoviesProvider).getPopularMovies();
});
