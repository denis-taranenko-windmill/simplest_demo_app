class User {
  final String id;
  final String name;

  User({required this.name, required this.id});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
