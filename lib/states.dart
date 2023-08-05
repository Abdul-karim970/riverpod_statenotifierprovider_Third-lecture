import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stream.dart';

abstract class StreamState {}

class StreamLoadingState extends StreamState {}

class StreamLoadedState extends StreamState {
  final int event;
  StreamLoadedState(this.event);
}

class StreamStateNotifier extends StateNotifier<StreamState> {
  StreamStateNotifier() : super(StreamLoadedState(0));

  void listenStream() async {
    valueStream().listen((event) {
      state = StreamLoadedState(event);
    });
  }
}
