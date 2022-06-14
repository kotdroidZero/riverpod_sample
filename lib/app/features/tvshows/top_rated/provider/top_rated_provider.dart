import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/network/repository/tv_shows/tv_shows_repo_impl.dart';
import 'package:riverpod_sample/data/models/responses/top_rated_shows.dart';

final getTopRatedShows = FutureProvider<TopRatedShows>((ref) {
  return ref.watch(tvShowsProvider).getTopRatedTvShows();
});
