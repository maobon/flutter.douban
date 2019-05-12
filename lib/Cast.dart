import 'Images.dart';

class Cast {
  String alt;
  Images avatars;
  String name;
  String id;

  Cast(this.alt, this.avatars, this.name, this.id);

  @override
  String toString() {
    return 'Cast{alt: $alt, avatars: $avatars, name: $name, id: $id}';
  }

  factory Cast.fromJson(Map<String, dynamic> map) {
    return Cast(map['alt'], Images.fromJson(map), map['name'], map['id']);
  }
}
