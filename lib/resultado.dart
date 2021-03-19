import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  Resultado(this.pontuacao);

  String get fraseResultado {
    switch (pontuacao < 8
        ? "Parabéns"
        : pontuacao < 12
            ? "Bom"
            : pontuacao < 16
                ? "Impressionante"
                : null) {
      case "Parabéns":
        return "Parabéns";
        break;
      case "Bom":
        return "Muito bom!";
        break;
      case "Impressionante":
        return "Impressionante!";
        break;
      default:
        return "Nível Jedi!";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
