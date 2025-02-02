class Release {
  final int id;
  final double value;
  final String description;
  final DateTime date;
  final bool isInflow;
  Release({
    required this.id,
    required this.value,
    required this.description,
    required this.date,
    required this.isInflow,
  });

  factory Release.fromMap(Map<String, dynamic> map) {
    return Release(
      id: map['id'] as int,
      value: double.parse(map['value'].toString()),
      description: map['description'] as String,
      date: DateTime.parse(map['date']),
      isInflow: map['isInflow'] as bool,
    );
  }

  @override
  bool operator ==(covariant Release other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.value == value &&
        other.description == description &&
        other.date == date &&
        other.isInflow == isInflow;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        value.hashCode ^
        description.hashCode ^
        date.hashCode ^
        isInflow.hashCode;
  }
}
