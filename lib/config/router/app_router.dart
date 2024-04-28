import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreens.name,
      builder: (context, state) => const HomeScreens(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';

            return MovieScreen(movieId: movieId);
          },
        )
      ],
    ),
  ],
);
