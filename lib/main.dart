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

  final List<Map<String, Object>> _perguntas = const [
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
          : Resultado(),
    );
  }
}
