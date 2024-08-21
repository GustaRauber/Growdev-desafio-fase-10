class AddReleaseDto {
  final double value;
  final String description;
  final DateTime date;
  final bool isInflow;

  AddReleaseDto({
    required this.value,
    required this.description,
    required this.date,
    required this.isInflow,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'description': description,
      'date': date.toString(),
      'isInflow': isInflow,
    };
  }

  @override
  bool operator ==(covariant AddReleaseDto other) {
    if (identical(this, other)) return true;

    return other.value == value &&
        other.description == description &&
        other.date == date &&
        other.isInflow == isInflow;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        description.hashCode ^
        date.hashCode ^
        isInflow.hashCode;
  }
}
