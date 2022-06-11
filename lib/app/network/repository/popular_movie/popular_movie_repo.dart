import 'package:riverpod_sample/data/models/responses/popular_movies.dart';

///Author-Pushkar Srivastava
///Date-11/06/22

abstract class PopularMoviesRepository {
  Future<PopularMovies> getPopularMovies();
}
