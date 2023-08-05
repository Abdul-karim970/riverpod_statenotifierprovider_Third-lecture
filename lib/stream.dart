Stream<int> valueStream() async* {
  for (var i = 0; i < 50; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
