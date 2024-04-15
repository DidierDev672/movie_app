import 'package:flutter/material.dart';

class CustomApp extends StatelessWidget {
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_outlined,
                color: colors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
