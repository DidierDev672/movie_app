import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreens.name,
      builder: (context, state) => const HomeScreens(),
    )
  ],
);
