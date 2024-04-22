import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/providers/movie/movies_providers.dart';
import 'package:movie_app/presentation/providers/movie/movies_slideshow_provider.dart';
import 'package:movie_app/presentation/providers/providers.dart';
import 'package:movie_app/widget/widget.dart';

class HomeScreens extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeViews(),
      bottomNavigationBar: CustomBottomNavigation(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(toRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(noPlayingMoviesProvider);
    //! Popular movies
    final popularMovies = ref.watch(popularMoviesProvider);
    //! To rated movies
    final toRatedMovies = ref.watch(toRatedMoviesProvider);
    //! Up comming
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final slidesShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomApp(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(
                    movies: slidesShowMovies,
                  ),
                  MovieHorizontalview(
                    movies: nowPlayingMovies,
                    title: 'Solo en cine',
                    subTitle: 'Lunes 22',
                    loadNextPage: () => ref
                        .read(noPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalview(
                    movies: upComingMovies,
                    title: 'Próximamente',
                    subTitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(upComingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalview(
                    movies: nowPlayingMovies,
                    title: 'Solo en cine',
                    subTitle: 'Lunes 22',
                    loadNextPage: () => ref
                        .read(noPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalview(
                    movies: popularMovies,
                    title: 'Populares',
                    //subTitle: 'Lunes 22',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
                  MovieHorizontalview(
                    movies: toRatedMovies,
                    title: 'Mejor calificados',
                    subTitle: 'Desde siempre',
                    loadNextPage: () =>
                        ref.read(toRatedMoviesProvider.notifier).loadNextPage(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}
