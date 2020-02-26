class MovieModel {
  String title, image, rating, releaseYear;

  MovieModel({this.title, this.image, this.rating, this.releaseYear});

  factory MovieModel.fromJSON(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'].toString().trim(),
      image: json['image'].toString().trim(),
      rating: json['rating'].toString().trim(),
      releaseYear: json['releaseYear'].toString().trim(),
    );
  }
}
