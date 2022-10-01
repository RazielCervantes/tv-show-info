class ShowsInfos {
  final String name;
  final String image;
  final List<String> genres;
  final String rating;
  final String status;
  final String premiere;

  ShowsInfos({
    required this.name,
    required this.image,
    required this.genres,
    required this.rating,
    required this.status,
    required this.premiere,
  });

  factory ShowsInfos.fromJson(Map<String, dynamic> parsedJson) {
    var streetsFromJson = parsedJson['genres'];
    //print(streetsFromJson.runtimeType);
    // List<String> streetsList = new List<String>.from(streetsFromJson);
    List<String> showInfomed = streetsFromJson.cast<String>();

    return ShowsInfos(
      name: parsedJson['name'],
      image: parsedJson['image']['medium'],
      genres: List<String>.from(parsedJson["genres"]),
      rating: parsedJson['rating']['average'].toString(),
      status: parsedJson['status'],
      premiere: parsedJson['premiere'],
    );
  }
}
