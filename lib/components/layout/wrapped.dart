typedef WrapItemCallback<T> = T Function(T item);

extension IterableWrapped<T> on Iterable<T> {
  Iterable<T> wrapped(WrapItemCallback<T> wrapItem) sync* {
    for (final item in this) {
      yield wrapItem(item);
    }
  }
}

extension ListWrapped<T> on List<T> {
  List<T> wrapped(WrapItemCallback<T> wrapItem) {
    return IterableWrapped(this).wrapped(wrapItem).toList();
  }
}
