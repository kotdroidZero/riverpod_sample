import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/features/movies/popular_movies/page/popular_movies_page.dart';
import 'package:riverpod_sample/app/features/movies/top_rated_movies/top_rated_movies.dart';
import 'package:riverpod_sample/app/features/tvshows/latest/page/latest_tv_shows_page.dart';
import 'package:riverpod_sample/app/features/tvshows/popular/page/popular_tv_shows_page.dart';
import 'package:riverpod_sample/app/features/tvshows/top_rated/page/top_rated_page.dart';

enum MoviesMenu { popular, topRated, upcoming }

enum TvShowsMenu { latest, topRated, popular, onTheAir }

enum DrawerMenu { movies, tvShows }

class Submenu {
  Enum submenu;
  Submenu(this.submenu);
}

class DrawerMenuNotifier extends StateNotifier<DrawerMenu> {
  DrawerMenuNotifier() : super(DrawerMenu.movies);
  changeMenu(DrawerMenu menu) {
    state = menu;
  }
}

class DrawerSubMenuNotifier extends StateNotifier<Submenu> {
  DrawerSubMenuNotifier() : super(Submenu(MoviesMenu.popular));
  changeSubMenu(Submenu submenu) {
    state = submenu;
  }
}

/// selected menu
final menuProvider =
    StateNotifierProvider<DrawerMenuNotifier, DrawerMenu>((ref) {
  return DrawerMenuNotifier();
});

final subMenuProvider =
    StateNotifierProvider<DrawerSubMenuNotifier, Submenu>((ref) {
  return DrawerSubMenuNotifier();
});

final pageProvider = Provider((ref) {
  var menu = ref.watch(menuProvider);
  var submenu = ref.watch(subMenuProvider);
  return getPage(menu, submenu.submenu);
});

getPage(DrawerMenu menu, Enum submenu) {
  switch (menu) {
    case DrawerMenu.movies:
      switch (submenu) {
        case MoviesMenu.popular:
          {
            return const PopularMoviesPage();
          }
        case MoviesMenu.topRated:
          {
            return const TopRatedMoviesPage();
          }
        case MoviesMenu.upcoming:
          {
            return const TopRatedMoviesPage();
          }
      }
      break;
    case DrawerMenu.tvShows:
      switch (submenu) {
        case TvShowsMenu.latest:
          {
            return const LatestTvShowsPage();
          }
        case TvShowsMenu.topRated:
          {
            return const TopRatedPage();
          }
        case TvShowsMenu.popular:
          {
            return const PopularTvShowsPage();
          }
      }
      break;
  }
}
