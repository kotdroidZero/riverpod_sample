import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/core/widget/custom_loader.dart';
import 'package:riverpod_sample/app/features/tvshows/popular/provider/popular_tv_shows_provider.dart';
import 'package:riverpod_sample/app/features/tvshows/popular/widget/popular_tvshows_item.dart';
import 'package:riverpod_sample/data/models/responses/popular_tv_shows.dart';

class PopularTvShowsPage extends ConsumerWidget {
  const PopularTvShowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncPopularShows = ref.watch(getPopulartvShows);
    return Scaffold(
        body: asyncPopularShows.when(data: (data) {
      return SingleChildScrollView(
        child: Column(
          children: [
            showsList(data.results ?? []),
          ],
        ),
      );
    }, error: (e, t) {
      return Text(e.toString());
    }, loading: () {
      return const CustomLoader();
    }));
  }

  showsList(List<Result> tvShows) {
    return GridView.extent(
      shrinkWrap: true,
      primary: false,
      // padding: const EdgeInsets.all(16),
      crossAxisSpacing: 10,
      mainAxisSpacing: 5,
      maxCrossAxisExtent: 200.0,
      childAspectRatio: 3.5 / 7,
      children: tvShows.map((e) => PopularShowsItem(show: e)).toList(),
    );
  }
}
