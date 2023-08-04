import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifierprovider/state_and_stateNotifier/states.dart';

final albumProvider = StateNotifierProvider<AlbumStateNotifier, AlbumState>(
    (ref) => AlbumStateNotifier());
