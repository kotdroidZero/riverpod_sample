import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/core/widget/custom_loader.dart';
import 'package:riverpod_sample/app/features/tvshows/latest/provider/latest_tv_shows_provider.dart';

class LatestTvShowsPage extends ConsumerWidget {
  const LatestTvShowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncLatestTvShows = ref.watch(getLatesttvShows);
    return Scaffold(
      body: asyncLatestTvShows.when(
        data: (data) {
          return Text("data");
        },
        error: (e, t) {
          return Text('${e.toString()}');
        },
        loading: () {
          return CustomLoader();
        },
      ),
    );
  }
}
