import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.pontuacao, this.quandoReiniciarPerguntas, {super.key});

  final int pontuacao;
  final void Function() quandoReiniciarPerguntas;

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns !';
    } else if (pontuacao < 12) {
      return 'Você é bom !';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 29),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciarPerguntas,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: const Text('Reiniciar Formulario'),
        ),
      ],
    );
  }
}
