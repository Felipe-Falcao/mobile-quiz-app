import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';

void main() => runApp(Perguntas());

class Perguntas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perguntas',
      debugShowCheckedModeBanner: false,
      home: PerguntasApp(title: 'Perguntas'),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  PerguntasApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PerguntasAppState createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': "Qual a sua cor preferida?",
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'texto': "Qual o seu animal preferido?",
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': "Qual o seu instrutor preferido?",
        'respostas': ['Johnny', 'Daniel', 'Miyagi', 'Outro'],
      },
    ];

    List<String> respostas = perguntas[_perguntaSelecionada]["respostas"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Perguntas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...respostas.map((r) => Resposta(r, _responder)).toList(),
          ],
        ),
      ),
    );
  }
}
