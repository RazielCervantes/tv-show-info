// To parse this JSON data, do
//
//     final showInfo = showInfoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ShowInfo {
  ShowInfo({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int runtime;
  final int averageRuntime;
  final DateTime premiered;
  final dynamic ended;
  final String officialSite;
  final Schedule schedule;
  final Rating rating;
  final int weight;
  final Network network;
  final dynamic webChannel;
  final dynamic dvdCountry;
  final Externals externals;
  final Image image;
  final String summary;
  final int updated;
  final Links links;

  factory ShowInfo.fromJson(String str) => ShowInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShowInfo.fromMap(Map<String, dynamic> json) => ShowInfo(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: DateTime.parse(json["premiered"]),
        ended: json["ended"],
        officialSite: json["officialSite"],
        schedule: Schedule.fromMap(json["schedule"]),
        rating: Rating.fromMap(json["rating"]),
        weight: json["weight"],
        network: Network.fromMap(json["network"]),
        webChannel: json["webChannel"],
        dvdCountry: json["dvdCountry"],
        externals: Externals.fromMap(json["externals"]),
        image: Image.fromMap(json["image"]),
        summary: json["summary"],
        updated: json["updated"],
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered":
            "${premiered.year.toString().padLeft(4, '0')}-${premiered.month.toString().padLeft(2, '0')}-${premiered.day.toString().padLeft(2, '0')}",
        "ended": ended,
        "officialSite": officialSite,
        "schedule": schedule.toMap(),
        "rating": rating.toMap(),
        "weight": weight,
        "network": network.toMap(),
        "webChannel": webChannel,
        "dvdCountry": dvdCountry,
        "externals": externals.toMap(),
        "image": image.toMap(),
        "summary": summary,
        "updated": updated,
        "_links": links.toMap(),
      };
}

class Externals {
  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  final int tvrage;
  final int thetvdb;
  final String imdb;

  factory Externals.fromJson(String str) => Externals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Externals.fromMap(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
      );

  Map<String, dynamic> toMap() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

class Image {
  Image({
    required this.medium,
    required this.original,
  });

  final String medium;
  final String original;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toMap() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Links({
    required this.self,
    required this.previousepisode,
  });

  final Previousepisode self;
  final Previousepisode previousepisode;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: Previousepisode.fromMap(json["self"]),
        previousepisode: Previousepisode.fromMap(json["previousepisode"]),
      );

  Map<String, dynamic> toMap() => {
        "self": self.toMap(),
        "previousepisode": previousepisode.toMap(),
      };
}

class Previousepisode {
  Previousepisode({
    required this.href,
  });

  final String href;

  factory Previousepisode.fromJson(String str) =>
      Previousepisode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Previousepisode.fromMap(Map<String, dynamic> json) => Previousepisode(
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class Network {
  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  final int id;
  final String name;
  final Country country;
  final String officialSite;

  factory Network.fromJson(String str) => Network.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Network.fromMap(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country: Country.fromMap(json["country"]),
        officialSite: json["officialSite"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "country": country.toMap(),
        "officialSite": officialSite,
      };
}

class Country {
  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  final String name;
  final String code;
  final String timezone;

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

class Rating {
  Rating({
    required this.average,
  });

  final double average;

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        average: json["average"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "average": average,
      };
}

class Schedule {
  Schedule({
    required this.time,
    required this.days,
  });

  final String time;
  final List<String> days;

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: List<String>.from(json["days"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
      };
}
