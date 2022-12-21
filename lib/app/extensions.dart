// extensions on string
extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

//extension on Integer
extension NonNullInteger on int? {
  int onZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}
