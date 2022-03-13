class AppState {
  num? firstNumber;
  num? secondNumber;
  String? operator;
  String? zarez;

//<editor-fold desc="Data Methods">

  AppState({
    this.firstNumber,
    this.secondNumber,
    this.operator,
    this.zarez,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppState &&
          runtimeType == other.runtimeType &&
          firstNumber == other.firstNumber &&
          secondNumber == other.secondNumber &&
          operator == other.operator &&
          zarez == other.zarez
      );

  @override
  int get hashCode => firstNumber.hashCode ^ secondNumber.hashCode ^ operator.hashCode ^ zarez.hashCode;

  @override
  String toString() {
    return 'AppState{' +
        ' firstNumber: $firstNumber,' +
        ' secondNumber: $secondNumber,' +
        ' operator: $operator,' +
        ' operator: $zarez,' +
        '}';
  }

  AppState copyWith({
    num? firstNumber,
    num? secondNumber,
    String? operator,
    String? zarez,
  }) {
    return AppState(
      firstNumber: firstNumber ?? this.firstNumber,
      secondNumber: secondNumber ?? this.secondNumber,
      operator: operator ?? this.operator,
      zarez: zarez ?? this.zarez,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstNumber': this.firstNumber,
      'secondNumber': this.secondNumber,
      'operator': this.operator,
      'zarez': this.zarez,

    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      firstNumber: map['firstNumber'] as num,
      secondNumber: map['secondNumber'] as num,
      operator: map['operator'] as String,
      zarez: map['zarez'] as String,

    );
  }

//</editor-fold>
}
