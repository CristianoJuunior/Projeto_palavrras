import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Rosa', 'Azul', 'Lilas'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Hámster', 'Peixe'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Cristiano', 'Marcos', 'Lucas', 'Leo'],
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    //isso e declarativo:
    //List<Widget> widgets = respostas.map((texto) => Resposta(texto, _responder)).toList()  ;
    //--------
    //isso aqui e imperativo:
    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  //spread sao os "..." => e pode ser usado para estender os elementos de uma coleção e também para concatenar coleções.
                  ...respostas
                      .map((texto) => Resposta(texto, _responder))
                      .toList(),
                ],
              )
            : const Center(
                child: Text(
                  'Parabens !',
                  style: TextStyle(fontSize: 29),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
