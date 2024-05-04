import 'package:flutter/material.dart';
import 'package:movie_app/presentation/views/views.dart';
import 'package:movie_app/widget/widget.dart';

class HomeScreens extends StatelessWidget {
  static const name = "home_screen";
  final int pageIndex;
  const HomeScreens({
    super.key,
    required this.pageIndex,
  });

  final viewRoutes = const <Widget>[
    HomeViews(),
    SizedBox(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
