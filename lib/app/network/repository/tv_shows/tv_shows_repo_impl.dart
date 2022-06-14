import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/network/dio_provider.dart';
import 'package:riverpod_sample/app/network/repository/api_repository.dart';
import 'package:riverpod_sample/app/network/repository/tv_shows/tv_sows_repo.dart';
import 'package:riverpod_sample/data/models/responses/latest_tv_shows.dart';
import 'package:riverpod_sample/data/models/responses/popular_tv_shows.dart';
import 'package:riverpod_sample/data/models/responses/top_rated_shows.dart';

class TvShowsRepoImpl extends ApiRepository implements TvShowsRepoRepository {
  @override
  Future<PopularTvShows> getPopularTvShows() {
    var endPoint =
        "${DioProvider.baseUrl}/tv/popular?api_key=4fccc5c11e3b4a2ba163b94dab4b4181&language=en-US&page=1";

    var dioCall = getApi(endPoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => PopularTvShows.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LatestTvShows> getLatestTvShows() {
    var endPoint =
        "${DioProvider.baseUrl}/tv/latest?api_key=4fccc5c11e3b4a2ba163b94dab4b4181&language=en-US&page=1";
    var dioCall = getApi(endPoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => LatestTvShows.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TopRatedShows> getTopRatedTvShows() {
     var endPoint =
        "${DioProvider.baseUrl}/tv/top_rated?api_key=4fccc5c11e3b4a2ba163b94dab4b4181&language=en-US&page=1";
    var dioCall = getApi(endPoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => TopRatedShows.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}

final tvShowsProvider = Provider<TvShowsRepoImpl>((ref) {
  return TvShowsRepoImpl();
});
