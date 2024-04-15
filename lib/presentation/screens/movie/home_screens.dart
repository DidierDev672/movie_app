import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/providers/movie/movies_providers.dart';
import 'package:movie_app/widget/shared/custom_app.dart';

class HomeScreens extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeViews(),
    );
  }
}

class _HomeViews extends ConsumerStatefulWidget {
  const _HomeViews();

  @override
  _HomeViewsState createState() => _HomeViewsState();
}

class _HomeViewsState extends ConsumerState<_HomeViews> {
  @override
  void initState() {
    super.initState();
    ref.read(noPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(noPlayingMoviesProvider);
    return Column(
      children: [
        const CustomApp(),
        Expanded(
          child: ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder: (context, index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          ),
        ),
      ],
    );
  }
}
