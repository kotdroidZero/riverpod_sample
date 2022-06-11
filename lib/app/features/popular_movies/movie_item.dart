import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_sample/app/core/values/app_colors.dart';
import 'package:riverpod_sample/app/core/values/text_styles.dart';
import 'package:riverpod_sample/data/models/responses/popular_movies.dart';

///Author-Pushkar Srivastava
///Date-11/06/22

class PopularMovieItem extends ConsumerWidget {
  const PopularMovieItem({this.movie, Key? key}) : super(key: key);

  final Result? movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.01),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: kIsWeb
                      ? MediaQuery.of(context).size.height * 0.23
                      : MediaQuery.of(context).size.height * 0.35,
                  child: ClipRRect(
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500/${movie?.posterPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: NetworkImage(
                  //       "https://image.tmdb.org/t/p/w500/${movie?.posterPath}",
                  //     ),
                  //   ),
                  // ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 4),
                      child: Text(
                        movie?.title ?? "",
                        style: cardTitleStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 20),
                      child: Text(DateFormat('MMM d, yyyy')
                          .format(movie?.releaseDate ?? DateTime.now())),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: 5,
              top: kIsWeb
                  ? MediaQuery.of(context).size.height * 0.2
                  : MediaQuery.of(context).size.height * 0.32,
              child: userRatingWidget(movie!),
            ),
          ],
        ),
      ),
    );
  }

  userRatingWidget(Result movie) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.appBarColor),
        color: Colors.black.withOpacity(0.9),
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          movie.getVotingPercentage().toString() + '%',
          style: labelStyle,
        ),
      ),
    );
  }
}
