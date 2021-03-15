import 'package:flutter/material.dart';
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
    final perguntas = [
      "Qual a sua cor preferida?",
      "Qual o seu animal preferido?",
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Perguntas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Questao(perguntas[_perguntaSelecionada]),
            ElevatedButton(child: Text("Resposta 1"), onPressed: _responder),
            ElevatedButton(child: Text("Resposta 2"), onPressed: _responder),
            ElevatedButton(child: Text("Resposta 3"), onPressed: _responder),
          ],
        ),
      ),
    );
  }
}
