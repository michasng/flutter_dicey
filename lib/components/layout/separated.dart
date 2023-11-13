extension IterableSeparated<T> on Iterable<T> {
  Iterable<T> separated(T separator) sync* {
    int index = 0;
    for (final item in this) {
      yield item;
      if (index != length - 1) yield separator;
      index++;
    }
  }
}

extension ListSeparated<T> on List<T> {
  List<T> separated(T separator) {
    return IterableSeparated(this).separated(separator).toList();
  }
}
