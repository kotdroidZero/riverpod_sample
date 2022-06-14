import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/app/core/widget/custom_loader.dart';
import 'package:riverpod_sample/app/features/tvshows/top_rated/provider/top_rated_provider.dart';

class TopRatedPage extends ConsumerWidget {
  const TopRatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncTopRated = ref.watch(getTopRatedShows);
    return Scaffold(
      body: asyncTopRated.when(
          data: (data) {
            return Center(
              child: Text('${data.results?.length}'),
            );
          },
          error: (e, t) {
            return Center(
              child: Text('${e.toString()}'),
            );
          },
          loading: () => const CustomLoader()),
    );
  }
}
