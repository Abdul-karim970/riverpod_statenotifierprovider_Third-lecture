import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifierprovider/provider.dart';
import 'package:riverpod_statenotifierprovider/states.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});
  Text text = Text('');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            var state = ref.watch(streamProvider);
            if (state is StreamLoadingState) {
              return CircularProgressIndicator();
            } else if (state is StreamLoadedState) {
              return Text(state.event.toString());
            } else {
              return text;
            }
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            ref.read(streamProvider.notifier).listenStream();
          },
          child: const Text('Fetch data')),
    );
  }
}
