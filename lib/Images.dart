class Images {
  String small;
  String large;
  String medium;

  Images(this.small, this.large, this.medium);

  @override
  String toString() {
    return 'Avatar{small: $small, large: $large, medium: $medium}';
  }

  factory Images.fromJson(Map<String, dynamic> map) {
    return Images(map['small'], map['large'], map['medium']);
  }
}
