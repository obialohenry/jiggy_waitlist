class SouthEastUniversityResponse {
  int? id;
  String? name;
  String? shortName;

  SouthEastUniversityResponse({
    this.id,
    this.name,
    this.shortName,
  });

  SouthEastUniversityResponse copyWith({
    int? id,
    String? name,
    String? shortName,
  }) {
    return SouthEastUniversityResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'short_name': shortName,
    };
  }

  factory SouthEastUniversityResponse.fromJson(Map<String, dynamic> json) {
    return SouthEastUniversityResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      shortName: json['short_name'] as String?,
    );
  }

  @override
  String toString() => "Response(id: $id,name: $name,shortName: $shortName)";

  @override
  int get hashCode => Object.hash(id, name, shortName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SouthEastUniversityResponse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          shortName == other.shortName;
}
