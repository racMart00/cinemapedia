import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  Stream<String> getLoadingMessages(){
    final messages = <String>[

      'Cargando Peliculas',
      'Comprando Palomitas de Maiz',
      'Cargando Peliculas Populares',
      'LLamando a mi Novia',
      'Ya mero...',
      'Esta esta tardando mas de lo esperado :(',

    ];

    return Stream.periodic( const Duration( milliseconds: 1500 ), ( step ){
      return messages[ step ];
    }).take( messages.length );
  }

  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          const Text('Espere por favor'),
          const SizedBox( height: 10 ),
          const CircularProgressIndicator( strokeWidth: 2 ),
          const SizedBox( height: 10 ),

          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if ( !snapshot.hasData ) return const Text('Cargando...');

              return Text( snapshot.data! );
            },
          ),

        ],
      )
    );
  }
}