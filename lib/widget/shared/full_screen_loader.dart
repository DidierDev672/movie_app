import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessage() {
    final messages = <String>[
      'Cargando peliculas',
      'Comprando palomitas de maíz',
      'En el cine, como en el desierto de Arrakis, cada escena puede ser una batalla por el control del mensaje; el guionista y el director luchan por el equilibrio entre el poder de la narrativa y la vastedad del silencio.',
      'Llamando a mi novia',
      'Los efectos visuales en una película son como las especias: adictivos, tentadores y, en exceso, capaces de distorsionar la verdadera esencia de la historia.'
          'Esto está tardando mas de lo esperado 🥱'
    ];

    return Stream.periodic(
      const Duration(
        milliseconds: 1200,
      ),
      (step) {
        return messages[step];
      },
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: getLoadingMessage(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
