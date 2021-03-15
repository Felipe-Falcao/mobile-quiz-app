import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String buttonTitle;
  final void Function() quandoSelecionado;

  Resposta(this.buttonTitle, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
