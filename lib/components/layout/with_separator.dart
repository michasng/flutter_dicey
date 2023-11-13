extension IterableWithSeparator<T> on Iterable<T> {
  Iterable<T> withSeparator(T separator) sync* {
    int index = 0;
    for (var e in this) {
      yield e;
      if (index != length - 1) yield separator;
      index++;
    }
  }
}

extension ListWithSeparator<T> on List<T> {
  List<T> withSeparator(T separator) {
    return IterableWithSeparator(this).withSeparator(separator).toList();
  }
}
