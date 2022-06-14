import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/features/dashboard/provider/dashboard_provider.dart';

class DashboardDrawer extends ConsumerWidget {
  const DashboardDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(children: [
        ExpansionTile(
          title: Text("Movies"),
          children: [...moviesSubCat(ref, context)],
        ),
        ExpansionTile(
          title: Text("Tv Shows"),
          children: [...tvShowsSubCat(ref, context)],
        )
      ]),
    );
  }

  moviesSubCat(ref, context) {
    return [
      subCateItem("Popular", onClick: () {
        changeSubMenu(
            DrawerMenu.movies, Submenu(MoviesMenu.popular), ref, context);
      }),
      subCateItem("Top Rated", onClick: () {
        changeSubMenu(
            DrawerMenu.movies, Submenu(MoviesMenu.topRated), ref, context);
      }),
      subCateItem("Upcoming", onClick: () {
        changeSubMenu(
            DrawerMenu.movies, Submenu(MoviesMenu.upcoming), ref, context);
      }),
    ];
  }

  tvShowsSubCat(ref, context) {
    return [
      subCateItem("Latest", onClick: () {
        changeSubMenu(
            DrawerMenu.tvShows, Submenu(TvShowsMenu.latest), ref, context);
      }),
      subCateItem("Top Rated", onClick: () {
        changeSubMenu(
            DrawerMenu.tvShows, Submenu(TvShowsMenu.topRated), ref, context);
      }),
      subCateItem("Popular", onClick: () {
        changeSubMenu(
            DrawerMenu.tvShows, Submenu(TvShowsMenu.popular), ref, context);
      }),
      subCateItem("On The Air", onClick: () {
        changeSubMenu(
            DrawerMenu.tvShows, Submenu(TvShowsMenu.onTheAir), ref, context);
      }),
    ];
  }

  subCateItem(label, {onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 10,
          bottom: 10,
        ),
        width: 500,
        child: Text(
          label,
          // style: labelStyle,
        ),
      ),
    );
  }

  changeSubMenu(
    DrawerMenu menu,
    Submenu submenu,
    WidgetRef ref,
    context,
  ) {
    ref.read(menuProvider.notifier).changeMenu(menu);
    ref.read(subMenuProvider.notifier).changeSubMenu(submenu);
    Navigator.of(context).maybePop();
  }
}
