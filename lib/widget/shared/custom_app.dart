import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/delagates/search_movie_delegate.dart';
import 'package:movie_app/presentation/providers/providers.dart';

import '../../domain/domain.dart';

class CustomApp extends ConsumerWidget {
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_outlined,
                color: colors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Cinemapedia',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final searchedMovies = ref.read(searchMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      initialMovies: searchedMovies,
                      searchMovies: ref
                          .read(searchMoviesProvider.notifier)
                          .searchMoviesByQuery,
                    ),
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/home/0/movie/${movie.id}');
                  });
                },
                icon: const Icon(
                  Icons.search,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
