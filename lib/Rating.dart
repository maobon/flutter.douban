class Rating {
  int max;
  double average;
  String stars;
  int min;

  Rating(this.max, this.average, this.stars, this.min);

  @override
  String toString() {
    return 'Rating{max: $max, average: $average, stars: $stars, min: $min}';
  }

  factory Rating.fromJson(Map<String, dynamic> map) {
    return Rating(map['max'], map['average'], map['stars'], map['min']);
  }
}
