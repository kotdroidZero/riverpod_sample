import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/network/dio_provider.dart';
import 'package:riverpod_sample/app/network/repository/api_repository.dart';
import 'package:riverpod_sample/app/network/repository/popular_movie/popular_movie_repo.dart';
import 'package:riverpod_sample/data/models/responses/popular_movies.dart';

///Author-Pushkar Srivastava
///Date-11/06/22

class PopularMoviesRepositoryImpl extends ApiRepository
    implements PopularMoviesRepository {
  @override
  Future<PopularMovies> getPopularMovies() {
    var endPoint =
        "${DioProvider.baseUrl}/movie/popular?api_key=4fccc5c11e3b4a2ba163b94dab4b4181&language=en-US&page=1";

    var dioCall = getApi(endPoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => PopularMovies.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}

final popularMoviesProvider = Provider<PopularMoviesRepositoryImpl>((ref) {
  return PopularMoviesRepositoryImpl();
});
