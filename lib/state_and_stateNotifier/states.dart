import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifierprovider/api_provider.dart';

import '../Album.dart';

abstract class AlbumState {}

class InitialState extends AlbumState {}

class LoadingState extends AlbumState {}

class LoadedState extends AlbumState {
  final List<Album> albums;
  LoadedState(this.albums);
}

class ErrorState extends AlbumState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class AlbumStateNotifier extends StateNotifier<AlbumState> {
  AlbumStateNotifier() : super(InitialState());

  final albumApiProvider = AlbumApiProvider();

  void fetch() async {
    state = LoadingState();

    try {
      state = LoadedState(await albumApiProvider.fetchAlbums());
    } catch (e) {
      state = ErrorState(e.toString());
    }
  }
}
