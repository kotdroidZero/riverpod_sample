class PopularTvShows {
  PopularTvShows({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory PopularTvShows.fromJson(Map<String, dynamic> json) => PopularTvShows(
        page: json["page"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  getVotingPercentage() => (voteAverage ?? 0.0) * 10;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_name": originalName == null ? null : originalName,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}
