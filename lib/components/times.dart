typedef TimesCallback<T> = T Function(int index);

extension Times on int {
  Iterable<T> times<T>(TimesCallback<T> action) sync* {
    for (int index = 0; index < this; index++) {
      yield action(index);
    }
  }
}
