import 'Subject.dart';

class MoviesData {
  int count;
  int start;
  int total;
  List<Subject> subjects;
  String title;

  MoviesData(this.count, this.start, this.total, this.subjects, this.title);

  @override
  String toString() {
    return 'MoviesData{count: $count, start: $start, total: $total, subjects: $subjects, title: $title}';
  }

  factory MoviesData.fromJson(Map<String, dynamic> json) {
    var subjectList = json['subjects'] as List;

    List<Subject> subjects = subjectList.map((i) => Subject.fromJson(i)).toList();

    return MoviesData(
        json['count'], json['start'], json['total'], subjects, json['title']);
  }
}
