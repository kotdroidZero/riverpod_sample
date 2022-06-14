class LatestTvShows {
  LatestTvShows({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  List<dynamic>? createdBy;
  List<dynamic>? episodeRunTime;
  DateTime? firstAirDate;
  List<dynamic>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<dynamic>? languages;
  DateTime? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  dynamic nextEpisodeToAir;
  List<dynamic>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  int? popularity;
  String? posterPath;
  List<dynamic>? productionCompanies;
  List<dynamic>? productionCountries;
  List<Season>? seasons;
  List<dynamic>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  int? voteAverage;
  int? voteCount;

  factory LatestTvShows.fromJson(Map<String, dynamic> json) => LatestTvShows(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        createdBy: json["created_by"] == null
            ? null
            : List<dynamic>.from(json["created_by"].map((x) => x)),
        episodeRunTime: json["episode_run_time"] == null
            ? null
            : List<dynamic>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genres: json["genres"] == null
            ? null
            : List<dynamic>.from(json["genres"].map((x) => x)),
        homepage: json["homepage"] == null ? null : json["homepage"],
        id: json["id"] == null ? null : json["id"],
        inProduction:
            json["in_production"] == null ? null : json["in_production"],
        languages: json["languages"] == null
            ? null
            : List<dynamic>.from(json["languages"].map((x) => x)),
        lastAirDate: json["last_air_date"] == null
            ? null
            : DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir: json["last_episode_to_air"] == null
            ? null
            : LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
        name: json["name"] == null ? null : json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: json["networks"] == null
            ? null
            : List<dynamic>.from(json["networks"].map((x) => x)),
        numberOfEpisodes: json["number_of_episodes"] == null
            ? null
            : json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"] == null
            ? null
            : json["number_of_seasons"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? null
            : List<dynamic>.from(json["production_companies"].map((x) => x)),
        productionCountries: json["production_countries"] == null
            ? null
            : List<dynamic>.from(json["production_countries"].map((x) => x)),
        seasons: json["seasons"] == null
            ? null
            : List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        spokenLanguages: json["spoken_languages"] == null
            ? null
            : List<dynamic>.from(json["spoken_languages"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        tagline: json["tagline"] == null ? null : json["tagline"],
        type: json["type"] == null ? null : json["type"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "created_by": createdBy == null
            ? null
            : List<dynamic>.from(createdBy!.map((x) => x)),
        "episode_run_time": episodeRunTime == null
            ? null
            : List<dynamic>.from(episodeRunTime!.map((x) => x)),
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genres":
            genres == null ? null : List<dynamic>.from(genres!.map((x) => x)),
        "homepage": homepage == null ? null : homepage,
        "id": id == null ? null : id,
        "in_production": inProduction == null ? null : inProduction,
        "languages": languages == null
            ? null
            : List<dynamic>.from(languages!.map((x) => x)),
        "last_air_date": lastAirDate == null
            ? null
            : "${lastAirDate!.year.toString().padLeft(4, '0')}-${lastAirDate!.month.toString().padLeft(2, '0')}-${lastAirDate!.day.toString().padLeft(2, '0')}",
        "last_episode_to_air":
            lastEpisodeToAir == null ? null : lastEpisodeToAir!.toJson(),
        "name": name == null ? null : name,
        "next_episode_to_air": nextEpisodeToAir,
        "networks": networks == null
            ? null
            : List<dynamic>.from(networks!.map((x) => x)),
        "number_of_episodes":
            numberOfEpisodes == null ? null : numberOfEpisodes,
        "number_of_seasons": numberOfSeasons == null ? null : numberOfSeasons,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_name": originalName == null ? null : originalName,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "production_companies": productionCompanies == null
            ? null
            : List<dynamic>.from(productionCompanies!.map((x) => x)),
        "production_countries": productionCountries == null
            ? null
            : List<dynamic>.from(productionCountries!.map((x) => x)),
        "seasons": seasons == null
            ? null
            : List<dynamic>.from(seasons!.map((x) => x.toJson())),
        "spoken_languages": spokenLanguages == null
            ? null
            : List<dynamic>.from(spokenLanguages!.map((x) => x)),
        "status": status == null ? null : status,
        "tagline": tagline == null ? null : tagline,
        "type": type == null ? null : type,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}

class LastEpisodeToAir {
  LastEpisodeToAir({
    this.airDate,
    this.episodeNumber,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
  });

  DateTime? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  dynamic runtime;
  int? seasonNumber;
  dynamic stillPath;
  int? voteAverage;
  int? voteCount;

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      LastEpisodeToAir(
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeNumber:
            json["episode_number"] == null ? null : json["episode_number"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        overview: json["overview"] == null ? null : json["overview"],
        productionCode:
            json["production_code"] == null ? null : json["production_code"],
        runtime: json["runtime"],
        seasonNumber:
            json["season_number"] == null ? null : json["season_number"],
        stillPath: json["still_path"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate == null
            ? null
            : "${airDate!.year.toString().padLeft(4, '0')}-${airDate!.month.toString().padLeft(2, '0')}-${airDate!.day.toString().padLeft(2, '0')}",
        "episode_number": episodeNumber == null ? null : episodeNumber,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "overview": overview == null ? null : overview,
        "production_code": productionCode == null ? null : productionCode,
        "runtime": runtime,
        "season_number": seasonNumber == null ? null : seasonNumber,
        "still_path": stillPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}

class Season {
  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  DateTime? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  dynamic posterPath;
  int? seasonNumber;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeCount:
            json["episode_count"] == null ? null : json["episode_count"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        overview: json["overview"] == null ? null : json["overview"],
        posterPath: json["poster_path"],
        seasonNumber:
            json["season_number"] == null ? null : json["season_number"],
      );

  Map<String, dynamic> toJson() => {
        "air_date": airDate == null
            ? null
            : "${airDate!.year.toString().padLeft(4, '0')}-${airDate!.month.toString().padLeft(2, '0')}-${airDate!.day.toString().padLeft(2, '0')}",
        "episode_count": episodeCount == null ? null : episodeCount,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "overview": overview == null ? null : overview,
        "poster_path": posterPath,
        "season_number": seasonNumber == null ? null : seasonNumber,
      };
}
