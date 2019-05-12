import 'Cast.dart';
import 'Rating.dart';
import 'Images.dart';

class Subject {
  Rating rating;
  List<String> genres;
  String title;
  List<Cast> casts;
  int collect_count;
  String original_title;
  String subtype;
  List<Cast> directors;
  String year;
  Images images;
  String alt;
  String id;

  Subject(
      this.rating,
      this.genres,
      this.title,
      this.casts,
      this.collect_count,
      this.original_title,
      this.subtype,
      this.directors,
      this.year,
      this.images,
      this.alt,
      this.id);

  @override
  String toString() {
    return 'Subject{rating: $rating, genres: $genres, title: $title, casts: $casts, collect_count: $collect_count, original_title: $original_title, subtype: $subtype, directors: $directors, year: $year, images: $images, alt: $alt, id: $id}';
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    List<String> genres = new List<String>.from(json['genres']);

    var castList = json['casts'] as List;
    List<Cast> casts = castList.map((i) => Cast.fromJson(i)).toList();

    var directorList = json['directors'] as List;
    List<Cast> directors = directorList.map((i) => Cast.fromJson(i)).toList();

    return Subject(
        Rating.fromJson(json['rating']),
        genres,
        json['title'],
        casts,
        json['collect_count'],
        json['original_title'],
        json['subtype'],
        directors,
        json['year'],
        Images.fromJson(json['images']),
        json['alt'],
        json['id']);
  }
}
