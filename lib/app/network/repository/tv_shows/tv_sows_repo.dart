import 'package:riverpod_sample/data/models/responses/latest_tv_shows.dart';
import 'package:riverpod_sample/data/models/responses/popular_tv_shows.dart';
import 'package:riverpod_sample/data/models/responses/top_rated_shows.dart';

abstract class TvShowsRepoRepository{
  Future<PopularTvShows> getPopularTvShows();
  Future<LatestTvShows> getLatestTvShows();
  Future<TopRatedShows> getTopRatedTvShows();

}