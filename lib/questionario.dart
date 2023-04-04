import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quantoResponder;

  @override
  Widget build(BuildContext context) {
    //isso e declarativo:
    //List<Widget> widgets = respostas.map((texto) => Resposta(texto, _responder)).toList()  ;
    //--------
    //isso aqui e imperativo:
    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        //spread sao os "..." => e pode ser usado para estender os elementos de uma coleção e também para concatenar coleções.
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => quantoResponder(resp['pontuacao'] as int),
          );
        }).toList(),
      ],
    );
  }
}
