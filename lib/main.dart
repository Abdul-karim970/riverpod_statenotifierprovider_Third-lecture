import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statenotifierprovider/provider.dart';
import 'package:riverpod_statenotifierprovider/state_and_stateNotifier/states.dart';

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
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            var state = ref.watch(albumProvider);
            if (state is InitialState) {
              return const Text('No Data');
            } else if (state is LoadingState) {
              return const CircularProgressIndicator();
            } else if (state is LoadedState) {
              return ListView.custom(
                childrenDelegate: SliverChildBuilderDelegate((context, index) {
                  var album = state.albums[index];
                  return ListTile(
                    title: Text(album.title),
                    leading: Text(album.id.toString()),
                  );
                }),
                padding: const EdgeInsets.all(20),
              );
            } else {
              return Text('Na kr ustaad!');
            }
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            ref.read(albumProvider.notifier).fetch();
          },
          child: const Text('Fetch data')),
    );
  }
}
