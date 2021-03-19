import 'package:flutter/material.dart';
import 'resultado.dart';
import 'questionario.dart';

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
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': "Qual a sua cor preferida?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': "Qual o seu animal preferido?",
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': "Qual o seu instrutor preferido?",
      'respostas': [
        {'texto': 'Johnny', 'pontuacao': 10},
        {'texto': 'Daniel', 'pontuacao': 5},
        {'texto': 'Miyagi', 'pontuacao': 3},
        {'texto': 'Outro', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Perguntas"),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntaSelecionada: _perguntaSelecionada,
              perguntas: _perguntas,
              quandoResponder: _responder,
            )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    );
  }
}
