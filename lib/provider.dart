import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifierprovider/states.dart';

final streamProvider = StateNotifierProvider<StreamStateNotifier, StreamState>(
    (ref) => StreamStateNotifier());
